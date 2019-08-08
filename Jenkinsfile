pipeline{
agent 
{
label "Linux"
}
	stages{
		stage("SonarQube analysis") {
			steps{
			withSonarQubeEnv('My SonarQube Server') {
			sh 'mvn clean package sonar:sonar'
			}
			}
		}	
		stage("Quality Gate"){
			steps{
			timeout(time: 10, unit: 'MINUTES') { 
			def qg = waitForQualityGate()
			if (qg.status != 'OK') {
			error "Pipeline aborted due to quality gate failure: ${qg.status}"
			}
			}
			}
			
		}
	}
}
