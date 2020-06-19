podTemplate (containers: [
    containerTemplate(
        name: 'jnlp',
        image: 'gcr.io/brightinsight-demo/jenkins-worker-image',
        alwaysPullImage: false
    )
]) {
    node(POD_LABEL) {
        withCredentials([
            file(credentialsId: 'terraform-service-account', variable: 'GOOGLE_APPLICATION_CREDENTIALS')
        ]) {

            stage('Checkout') {
                checkout(scm)
            }

            stage('Auth') {
                sh """
                    gcloud auth activate-service-account \
                        --key-file=${GOOGLE_APPLICATION_CREDENTIALS}

                    gcloud container clusters get-credentials cicd \
                        --region us-central1 \
                        --project brightinsight-demo
                """
            }

            dir('pipelines/canary-deploy') {
                stage('Init') {
                    sh 'terraform init'
                }

                stage('Deploy Canary') {
                    sh 'terraform apply'
                }

                stage('Smoke Test Canary') {
                    print('Smoke tests passed!')
                }

                stage('Deploy Primary') {
                    sh 'terraform apply'
                }

                stage('Tear Down Canary') {
                    sh 'terraform apply'
                }
            }
        }
    }
}