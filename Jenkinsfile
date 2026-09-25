pipeline {
    agent any

    environment {
        AWS_REGION='ap-south-1'
        ECR_REGISTRY='229032673310.dkr.ecr.ap-south-1.amazonaws.com'
        ECR_REPOSITORY='wild-tour'
        K8S_NAMESPACE='wild-tour'
        K8S_DEPLOYMENT='wild-tour'
        K8S_CONTAINER='wild-tour'
    }

    stages {
        stage('Build') {
            steps {
                dir('application') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Test') {
            steps {
                dir('application') {
                    sh 'mvn test'
                }
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'application/target/Wild_Tour.war', fingerprint: true
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
                    IMAGE_TAG="jenkins-${BUILD_NUMBER}"

                    docker build -t "wild-tour:${IMAGE_TAG}" .

                    echo "Verifying Docker image..."
                    docker image inspect "wild-tour:${IMAGE_TAG}" > /dev/null

                    echo "Docker image verified: wild-tour:${IMAGE_TAG}"
                '''
            }
        }

        stage('Approval') {
            steps {
                input message: 'Deploy this build to the Kubernetes/EKS cluster?', ok: 'Deploy'
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh '''
                    IMAGE_TAG="jenkins-${BUILD_NUMBER}"

                    DOCKER_CONFIG="$(mktemp -d)"
                    export DOCKER_CONFIG
                    trap 'rm -rf "$DOCKER_CONFIG"' EXIT

                    aws ecr get-login-password --region "$AWS_REGION" | \
                        docker login --username AWS --password-stdin "$ECR_REGISTRY"

                    docker tag "wild-tour:${IMAGE_TAG}" \
                        "$ECR_REGISTRY/$ECR_REPOSITORY:${IMAGE_TAG}"

                    docker push "$ECR_REGISTRY/$ECR_REPOSITORY:${IMAGE_TAG}"
                '''
            }
        }

	stage('Deploy') {
            steps {
                sh '''
                    ECR_IMAGE="$ECR_REGISTRY/$ECR_REPOSITORY:jenkins-${BUILD_NUMBER}"

                    echo "Checking Kubernetes cluster access..."
                    kubectl cluster-info

                    echo "Checking target deployment..."
                    kubectl -n "$K8S_NAMESPACE" get deployment "$K8S_DEPLOYMENT"

                    echo "Updating Kubernetes deployment to: $ECR_IMAGE"

                    kubectl -n "$K8S_NAMESPACE" set image deployment/"$K8S_DEPLOYMENT" \
                        "$K8S_CONTAINER"="$ECR_IMAGE"

                    kubectl -n "$K8S_NAMESPACE" rollout status \
                        deployment/"$K8S_DEPLOYMENT" --timeout=5m

                    kubectl -n "$K8S_NAMESPACE" get deployment "$K8S_DEPLOYMENT" \
                        -o jsonpath='{.spec.template.spec.containers[0].image}'

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
    """,
                to: "pruthviraj462004@gmail.com"
            )
        }
    }
}
