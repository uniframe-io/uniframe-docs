# This file build image for minikube environment push to ECR local repository
# Minikube always use dev environment

PRODUCT_PREFIX=uniframe
AWS_REGION=eu-west-1
DEPLOY_ENV=dev
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text) 
echo "Account_ID=${ACCOUNT_ID}"

IMAGE_TAG=minikube

DOC_REPO=$(aws ssm get-parameters --names ${PRODUCT_PREFIX}-${DEPLOY_ENV}-ssm-doc-local-repo-name --query "Parameters[*].Value | [0]" | tr -d '"')

eval $(minikube docker-env)  
docker build -t ${DOC_REPO} . -f Dockerfile
docker tag ${DOC_REPO}:latest ${DOC_REPO}:${IMAGE_TAG}
eval $(minikube docker-env -u)  


