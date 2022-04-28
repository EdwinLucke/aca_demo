az login

az extension add --name containerapp

az provider register --namespace Microsoft.App

RESOURCE_GROUP="my-container-apps"
LOCATION="canadacentral"
CONTAINERAPPS_ENVIRONMENT="my-environment"

az group create --name $RESOURCE_GROUP --location $LOCATION

az containerapp env create \
  --name $CONTAINERAPPS_ENVIRONMENT \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION

az containerapp create \
  --name my-container-app \
  --resource-group $RESOURCE_GROUP \
  --environment $CONTAINERAPPS_ENVIRONMENT \
  --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest \
  --target-port 80 \
  --ingress 'external' \
  --query properties.configuration.ingress.fqdn

az group delete \
  --name $RESOURCE_GROUP