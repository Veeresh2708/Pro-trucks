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
			} // SonarQube taskId is automatically attached to the pipeline context
			}
		}	
		stage("Quality Gate"){
			steps{
			timeout(time: 10, unit: 'MINUTES') { // Just in case something goes wrong, pipeline will be killed after a timeout
			def qg = waitForQualityGate() // Reuse taskId previously collected by withSonarQubeEnv
			if (qg.status != 'OK') {
				error "Pipeline aborted due to quality gate failure: ${qg.status}"
				}
			}
			}
			
		}
	}
}
