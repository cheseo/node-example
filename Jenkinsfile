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
				sh 'curl -H "x-terminate: true" https://node.ec2.ashwink.com.np'
			}
		}
	}
}
