pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            checkout scm
            }
        }
        
        stage ("/usr/bin/terraform init") {
            steps {
                sh ('/usr/bin/terraform init -reconfigure') 
            }
        }
        stage ("/usr/bin/terraform plan") {
            steps {
                sh ('/usr/bin/terraform plan') 
            }
        }
        stage ("/usr/bin/terraform apply") {
            steps {
                sh ('/usr/bin/terraform apply --auto-approve') 
            }
        }
    }
}
