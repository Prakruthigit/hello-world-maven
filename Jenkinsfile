pipeline {
    agent any

    stages {

         stage('Checkout') {
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
                script{
                    "sh mvn clean package"
                }
            }
        }

    }
}
