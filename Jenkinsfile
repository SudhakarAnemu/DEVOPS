pipeline{
    agent any
    stages{
        stage("code checkout"){
            steps{
                script{
                 sh " git clone https://github.com/harish11-dev/java-sample-app.git"
                }
            }
        }
        stage("count no.of files in repo"){
            steps{
                script{
                    sh"""cd java-sample-app
                        git ls-files | wc -l"""
                }
            }
        }
        
    }
}
