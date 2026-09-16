pipeline {
    agent any

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

        stage('Docker Build') {
            steps {
                sh 'docker build -t wild-tour:jenkins .'
            }
        }

        stage('Deploy') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'wild-tour-db',
                    usernameVariable: 'DB_USER',
                    passwordVariable: 'DB_PASSWORD'
                )]) {
                    sh '''
                        docker rm -f wild-tour-app || true
                        docker run -d \
                          --name wild-tour-app \
                          -p 8080:8080 \
                          -e DB_URL="jdbc:mysql://database-wild-tour.cfyo6wgou1au.ap-south-1.rds.amazonaws.com:3306/wildlife" \
                          -e DB_USER="$DB_USER" \
                          -e DB_PASSWORD="$DB_PASSWORD" \
                          wild-tour:jenkins
			docker inspect -f '{{.State.Running}}' wild-tour-app | grep -q true
                    '''
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    sleep 10
                    curl --fail --silent --show-error http://localhost:8080/Wild_Tour/ > /dev/null
                '''
            }
        }
    }
}
