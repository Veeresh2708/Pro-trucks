def STATUS = ['SUCCESS': 'good', 'FAILURE': 'danger', 'UNSTABLE': 'danger', 'ABORTED': 'danger']

pipeline {
    agent { label 'master' }
   
    environment {
        VER = VersionNumber([versionNumberString : '${BUILD_YEAR}.${BUILD_MONTH}.${BUILD_DAY}.TEST-API${BUILDS_ALL_TIME}', projectStartDate : '2018-11-25']);
        
    }
    stages 
	{

        stage('SCM') {
            steps {
                step([$class: 'WsCleanup'])
                script{
                    currentBuild.displayName = VER
                    sh  "echo $VER"          
                }
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'token', url: 'https://github.com/Veeresh2708/Pro-trucks.git']]])
			}
				
		}
				
		stage('Build') {
		environment {
		 	GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
		}
		   steps{
			sh "echo $GIT_COMMIT"
			sh "mvn clean package"
                   script {
                      GIT_COMMIT_HASH = sh (script: "git log --pretty=raw", returnStdout: true)
                    //sh "hi"
                    //sh "echo $GIT_COMMIT_HASH"
		   }
                   }
                }
		stage("ArtifactoryPublish")
		{
		    steps
		    {
			rtUpload (
			    serverId: 'Artifactory-1',
			    spec: '''{
				  "files": [
				  {
				      "pattern": "/var/jenkins_home/workspace/Publish Artifact/target/*.war",
				      "target": "test_maven/Pro-trucks_${VER}.war"
				  }
		        	  ]
			    }''',
 			)
			}
		}
	}
}
