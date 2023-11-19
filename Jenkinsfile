pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            checkout scm
            }
        }
        
        stage ("/opt/homebrew/bin/terraform init") {
            steps {
                sh ('/opt/homebrew/bin/terraform init -reconfigure') 
            }
        }
        stage ("/opt/homebrew/bin/terraform plan") {
            steps {
                sh ('/opt/homebrew/bin/terraform plan') 
            }
        }
        stage ("/opt/homebrew/bin/terraform apply") {
            steps {
                sh ('/opt/homebrew/bin/terraform apply --auto-approve') 
            }
        }
    }
}
