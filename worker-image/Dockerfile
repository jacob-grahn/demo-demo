FROM gcr.io/cloud-solutions-images/jenkins-k8s-slave
RUN yes | gcloud components update
WORKDIR /usr/bin
RUN wget -O terraform_0.12.26_linux_amd64.zip https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
RUN unzip terraform_0.12.26_linux_amd64.zip
RUN rm -f terraform_0.12.26_linux_amd64.zip
RUN apt-get update