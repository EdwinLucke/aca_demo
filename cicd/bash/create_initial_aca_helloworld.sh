az login

az extension add --name containerapp

az provider register --namespace Microsoft.App

RESOURCE_GROUP="my-qtree-container-apps"
LOCATION="westeurope"
CONTAINERAPPS_ENVIRONMENT="my-qtree-environment"

az group create --name $RESOURCE_GROUP --location $LOCATION

az containerapp env create \
  --name $CONTAINERAPPS_ENVIRONMENT \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION

az containerapp create \
  --name my-qtree-container-01-app \
  --resource-group $RESOURCE_GROUP \
  --environment $CONTAINERAPPS_ENVIRONMENT \
  --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest \
  --target-port 80 \
  --ingress 'external' \
  --query properties.configuration.ingress.fqdn

az group delete \
  --name $RESOURCE_GROUP