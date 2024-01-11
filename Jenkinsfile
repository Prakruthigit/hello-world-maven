pipeline {
    agent any

    stages {

         stage('Checkout git') {
            steps {
                checkout scm
            }
        }

        stage('DEV Pipeline') 
        {
            steps{
                script{
                    if("$GIT_BRANCH" == 'develop') {
                        echo "Loop success"
                    }
                    else {
                        echo "Other branch"
                    }
                }
            }
        } 
		
	stage('Gradle Build'){
            steps{
                sh "mvn clean package -DskipTests"
		sh "mv target/*.jar app_${BUILD_NUMBER}.jar"
            }
        }

	stage('ECR push) {
	      steps{
		      sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 499756076901.dkr.ecr.us-east-1.amazonaws.com"
		      sh"docker build -t newapp ."
		      sh "docker tag newapp:latest 499756076901.dkr.ecr.us-east-1.amazonaws.com/newapp:latest"
		      sh "docker push 499756076901.dkr.ecr.us-east-1.amazonaws.com/newapp:latest"
	      }
	}

    }
}
