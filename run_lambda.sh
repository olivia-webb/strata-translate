# Name of Docker container
CONTAINER_NAME=""
# Name of env file
ENV_FILE=""

# NEED name of env file
aws --profile ${AWS_PROFILE} --region us-east-1 ssm get-parameters --names ${ENV_FILE} --with-decryption | jq -r '.Parameters[0].Value' > .env
source .env

docker-compose -f docker-compose.yml build

docker run -p 9000:8080 ${CONTAINER_NAME}:latest