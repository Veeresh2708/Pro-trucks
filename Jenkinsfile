pipeline{
agent 
{
label "Linux"
}
	stages{
		stage("Building in Progress"){
			steps{
			mvn clean install
			}
		}
		stage("Sonarqube_code scanner"){
		
			environment {
				scannerHome = tool 'SonarQubeScanner'
			}
			steps {
				withSonarQubeEnv('sonarqube') {
					sh "${scannerHome}/bin/sonar-scanner"
				}
			timeout(time: 10, unit: 'MINUTES') {
				waitForQualityGate abortPipeline: true
			}
			}
		}
	}
}
