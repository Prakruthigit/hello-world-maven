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
		sh "mv target/*.jar target/app_${BUILD_NUMBER}.jar"
            }
        }

	stage('Deploy'){
	      when {
		      expression { BRANCH_NAME ==~ /(develop|qa|new-*)/ }
	      }
	      steps{
		      script{
			      if (BRANCH_NAME == 'develop'){
				      echo "Loop success in dev"
			      } else if (BRANCH_NAME == 'qa'){
				      echo "Loop success in qa"
			      } else if (BRANCH_NAME == 'new-*') {
				      echo "Loop success in new-branch"
			      }
			      
		      }
	      }
	}
	

    }
}
