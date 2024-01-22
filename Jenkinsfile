pipeline {
    agent any

    stages {

         stage('Checkout git') {
            steps {
                checkout scm
            }
        }
		
	stage('Gradle Build'){
            steps{
                sh "mvn clean package -DskipTests"
		sh "mv target/*.jar target/app_${BUILD_NUMBER}.jar"
            }
        }

	stage('Deploy'){
	      if (BRANCH_NAME == 'new-branch'){
		      steps{
			      script{
				      echo "Success in new"
			      }
		      }
	      }
	}

    }    
}
