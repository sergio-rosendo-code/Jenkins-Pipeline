pipeline
{
    agent any
    
    stages
    {
        stage('Checkout')
        {
            steps
            {
                checkout scmGit(branches: [[name: '*/clean-repo']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sergio-rosendo-code/Jenkins-Pipeline.git']])
            }
        }
        stage ('Build')
        {
            steps 
            {
                sh 'dotnet publish --configuration=release ./API/API.csproj -o api'
                
            }
        }
        stage ('Test')
        {
            steps
            {
                sh 'dotnet test ./API.Tests/API.Tests.csproj'
            }
        }
        stage ('Deploy')
        {
            steps
            {
                withCredentials([string(credentialsId: 'ACR_USER', variable: 'ACR_USER'), string(credentialsId: 'ACR_PWD', variable: 'ACR_PWD'), string(credentialsId: 'ACR_TENANT', variable: 'ACR_TENANT'), string(credentialsId: 'ACR_SERVER', variable: 'ACR_SERVER')]) 
                {
                    sh 'az login --service-principal -u $ACR_USER -p $ACR_PWD --tenant $ACR_TENANT'
                    sh 'az acr build --image $ACR_SERVER/api:v1.0.0 --registry $ACR_SERVER .'
                }
            }
        }
    }
}
