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
		sh "mv target/*.jar app_${BUILD_NO}.jar"
            }
        }

    }
}
