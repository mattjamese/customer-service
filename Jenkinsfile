node {

    withMaven(maven:'maven') {

        stage('Checkout') {
            git url: 'https://github.com/mattjamese/customer-service.git'
        }

        stage('Build') {
            sh 'mvn clean install'

            def pom = readMavenPom file:'pom.xml'
            print pom.version
            env.version = pom.version
        }
        
        /*stage('RemoveOldContainers'){	    
    	    script {
				  try {
				      sh 'docker rm -f customer'
				  } catch (Exception e) {
				     
				      build job: 'Image'
				  }
			}				     
		}*/
        

        stage('Image') {
            //dir ('customer-service') {
                def app = docker.build "localhost:5000/customer-service:${env.version}"
                app.push()
            //}
        }

        stage ('Run') {
            docker.image("localhost:5000/customer-service:${env.version}").run('-p 3333:3333 -h customer --name customer --link discovery --link account')
        }

        stage ('Final') {
            build job: 'gateway-service-pipeline', wait: false
        }      

    }

}
