def props = readProperties  file:'pipeline-properties/test.properties'
def Var1= props['Monday']
def Var2= props['Tuesday']

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

	stage('Check prperty file'){
		steps{
			echo "Var1=${Var1}"
			echo "Var2=${Var2}"
		}
	}

	

  }
}
