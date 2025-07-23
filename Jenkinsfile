pipeline {
	agent { docker { image 'node:22.17.1-alpine3.22' } }
	stages {
		stage('prelude'){
			steps {
				sh 'apt install -y ssh'
			}
		}
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
