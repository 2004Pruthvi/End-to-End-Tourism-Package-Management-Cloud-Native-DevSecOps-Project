pipeline {
    agent any

    options {
        // Readable, timestamped console output and sane build hygiene.
        timestamps()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '20'))
        timeout(time: 45, unit: 'MINUTES')
    }

    environment {
        AWS_REGION     = 'ap-south-1'
        ECR_REGISTRY   = '229032673310.dkr.ecr.ap-south-1.amazonaws.com'
        ECR_REPOSITORY = 'wild-tour'
        K8S_NAMESPACE  = 'wild-tour'
        K8S_DEPLOYMENT = 'wild-tour'
        K8S_CONTAINER  = 'wild-tour'
        // Deterministic image tag for the whole pipeline run.
        IMAGE_TAG      = "jenkins-${env.BUILD_NUMBER}"
    }

    stages {
        stage('Build & Test') {
            steps {
                dir('application') {
                    // 'verify' compiles, runs tests, generates the JaCoCo
                    // report and packages the WAR in a single Maven run.
                    sh 'mvn -B clean verify'
                }
            }
            post {
                always {
                    // Publish JUnit test results (trend graph in Jenkins).
                    junit testResults: 'application/target/surefire-reports/*.xml',
                          allowEmptyResults: true
                }
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'application/target/Wild_Tour.war',
                                 fingerprint: true
            }
        }

        stage('Publish JaCoCo Report') {
            steps {
                publishHTML(target: [
                    reportDir: 'application/target/site/jacoco',
                    reportFiles: 'index.html',
                    reportName: 'JaCoCo Coverage Report',
                    keepAll: true,
                    alwaysLinkToLastBuild: true,
                    allowMissing: false
                ])
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    set -eu

                    echo "Building Docker image: wild-tour:${IMAGE_TAG}"
                    docker build --pull -t "wild-tour:${IMAGE_TAG}" .

                    echo "Verifying Docker image..."
                    docker image inspect "wild-tour:${IMAGE_TAG}" > /dev/null

                    echo "Docker image verified: wild-tour:${IMAGE_TAG}"
                '''
            }
        }

        stage('Approval') {
            steps {
                // Production deployment stays manually approved, with a
                // timeout so a forgotten approval cannot block the agent.
                timeout(time: 30, unit: 'MINUTES') {
                    input message: """Deploy to PRODUCTION?
Build: #${env.BUILD_NUMBER}
Image tag: ${env.IMAGE_TAG}
Target namespace: ${env.K8S_NAMESPACE}
Target environment: production (EKS cluster wild-tour-eks, ${env.AWS_REGION})""",
                          ok: 'Deploy'
                }
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh '''
                    set -eu

                    ECR_IMAGE="$ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG"

                    # Temporary Docker auth config: credentials never touch
                    # the workspace or the default ~/.docker/config.json.
                    DOCKER_CONFIG="$(mktemp -d)"
                    export DOCKER_CONFIG
                    trap 'rm -rf "$DOCKER_CONFIG"' EXIT

                    aws ecr get-login-password --region "$AWS_REGION" | \
                        docker login --username AWS --password-stdin "$ECR_REGISTRY"

                    docker tag "wild-tour:${IMAGE_TAG}" "$ECR_IMAGE"
                    docker push "$ECR_IMAGE"

                    echo "Verifying pushed image..."
                    DIGEST="$(docker inspect --format='{{index .RepoDigests 0}}' "$ECR_IMAGE")"
                    if [ -z "$DIGEST" ]; then
                        echo "ERROR: could not verify pushed image digest."
                        exit 1
                    fi
                    echo "Pushed image digest: $DIGEST"
                '''
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh '''
                    set -eu

                    ECR_IMAGE="$ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG"

                    echo "Checking Kubernetes cluster access..."
                    kubectl cluster-info

                    echo "Checking target deployment..."
                    kubectl -n "$K8S_NAMESPACE" get deployment "$K8S_DEPLOYMENT"

                    echo "Updating deployment image to: $ECR_IMAGE"
                    kubectl -n "$K8S_NAMESPACE" set image deployment/"$K8S_DEPLOYMENT" \
                        "$K8S_CONTAINER"="$ECR_IMAGE"

                    echo "Waiting for rollout to complete..."
                    kubectl -n "$K8S_NAMESPACE" rollout status \
                        deployment/"$K8S_DEPLOYMENT" --timeout=5m

                    echo "Verifying deployed image..."
                    DEPLOYED_IMAGE="$(kubectl -n "$K8S_NAMESPACE" get deployment "$K8S_DEPLOYMENT" \
                        -o jsonpath='{.spec.template.spec.containers[0].image}')"
                    echo "Deployed image: $DEPLOYED_IMAGE"
                    if [ "$DEPLOYED_IMAGE" != "$ECR_IMAGE" ]; then
                        echo "ERROR: deployed image does not match expected image."
                        exit 1
                    fi

                    echo "Verifying pod readiness..."
                    kubectl -n "$K8S_NAMESPACE" wait --for=condition=ready pod \
                        -l app=wild-tour --timeout=3m

                    kubectl -n "$K8S_NAMESPACE" get pods -l app=wild-tour -o wide

                    echo "Kubernetes deployment successful."
                '''
            }
        }
    }

    post {
        success {
            emailext(
                subject: "Wild Tour CI/CD - SUCCESS - Build #${BUILD_NUMBER}",
                body: """
    Wild Tour CI/CD pipeline completed successfully.

    Project: ${JOB_NAME}
    Build: #${BUILD_NUMBER}
    Status: ${currentBuild.currentResult}
    Image: ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}
    Build URL: ${BUILD_URL}
    """,
                to: "pruthviraj462004@gmail.com"
            )
        }

        failure {
            emailext(
                subject: "Wild Tour CI/CD - FAILURE - Build #${BUILD_NUMBER}",
                body: """
    Wild Tour CI/CD pipeline failed.

    Project: ${JOB_NAME}
    Build: #${BUILD_NUMBER}
    Status: ${currentBuild.currentResult}
    Build URL: ${BUILD_URL}

    Check the console output for the failing stage.
    """,
                to: "pruthviraj462004@gmail.com"
            )
        }

        aborted {
            emailext(
                subject: "Wild Tour CI/CD - ABORTED - Build #${BUILD_NUMBER}",
                body: """
    Wild Tour CI/CD pipeline was aborted (for example, the deployment
    approval timed out or was rejected).

    Project: ${JOB_NAME}
    Build: #${BUILD_NUMBER}
    Build URL: ${BUILD_URL}
    """,
                to: "pruthviraj462004@gmail.com"
            )
        }

        always {
            // Remove locally built images so the agent does not fill up.
            // Safe: the pushed image lives in ECR.
            sh '''
                docker image rm -f "wild-tour:${IMAGE_TAG}" \
                    "$ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG" 2>/dev/null || true
            '''
        }
    }
}
