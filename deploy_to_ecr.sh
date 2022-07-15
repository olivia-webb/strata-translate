# ECR Repo Account {account_number}.dkr.ecr.us-east-1.amazonaws.com
ECR_AWS_REPO_URI=".dkr.ecr.us-east-1.amazonaws.com"
# Name of ECR container
CONTAINER_NAME=""

aws --profile ${AWS_PROFILE} --region us-east-1 ssm get-parameters --names "/${CONTAINER_NAME}/stage/env" --with-decryption | jq -r '.Parameters[0].Value' > .env
source .env

docker-compose -f docker-compose.yml build

aws ecr get-login-password --region us-east-1 --profile ${AWS_PROFILE} | docker login --username AWS --password-stdin ${ECR_AWS_REPO_URI}

docker tag ${CONTAINER_NAME}:latest ${ECR_AWS_REPO_URI}/${CONTAINER_NAME}:latest

docker push ${ECR_AWS_REPO_URI}/${CONTAINER_NAME}:latest

# aws lambda update-function-code --region sa-east-1 --function-name ${CONTAINER_NAME} --image-uri ${ECR_AWS_REPO_URI}/${CONTAINER_NAME}:latest