pipeline {
	agent { docker { image 'node:24-bookworm' } }
	stages {
		stage('build'){
			steps {
				sh 'node test.js'
			}
		}
		stage('deploy') {
			steps {
				withCredentials([sshUserPrivateKey(credentialsId: "node-ssh", keyFileVariable: 'keyfile')]) {
					sh 'ssh -i ${keyfile} ubuntu@node.ec2.ashwink.com.np ./update'
				}
			}
		}
	}
}
