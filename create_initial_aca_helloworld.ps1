az login

az extension add --name containerapp

az provider register --namespace Microsoft.App

$RESOURCE_GROUP="my-qtree-aca"
$LOCATION="westeurope"
$CONTAINERAPPS_ENVIRONMENT="my-qtree-aca-environment"
$LOGS_WORKSPACE_ID = "[ID]"

az group create `
  --name $RESOURCE_GROUP `
  --location $LOCATION

az containerapp env create `
  --name $CONTAINERAPPS_ENVIRONMENT `
  --resource-group $RESOURCE_GROUP `
  --location $LOCATION `
  --logs-workspace-id $LOGS_WORKSPACE_ID
  

az containerapp create `
  --name my-qtree-singlepage-app `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINERAPPS_ENVIRONMENT `
  --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest `
  --target-port 80 `
  --ingress 'external' `
  --query properties.configuration.ingress.fqdn

az containerapp create `
  --name my-qtree-service01-app `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINERAPPS_ENVIRONMENT `
  --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest `
  --target-port 80 `
  --ingress 'external' `
  --query properties.configuration.ingress.fqdn

az containerapp create `
  --name my-qtree-service02-app `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINERAPPS_ENVIRONMENT `
  --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest `
  --target-port 80 `
  --ingress 'external' `
  --query properties.configuration.ingress.fqdn

az containerapp create `
  --name my-qtree-zipkin-app `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINERAPPS_ENVIRONMENT `
  --image openzipkin/zipkin-slim `
  --target-port 9411 `
  --ingress 'external' `
  --query properties.configuration.ingress.fqdn

az containerapp create `
  --name my-qtree-jaeger-app `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINERAPPS_ENVIRONMENT `
  --image jaegertracing/all-in-one:1.33 `
  --target-port 16686 `
  --ingress 'external' `
  --query properties.configuration.ingress.fqdn

az containerapp create `
  --name my-qtree-prometheus-app `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINERAPPS_ENVIRONMENT `
  --image prom/prometheus `
  --target-port 9090 `
  --ingress 'external' `
  --query properties.configuration.ingress.fqdn

az containerapp create `
  --name my-qtree-grafana-app `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINERAPPS_ENVIRONMENT `
  --image grafana/grafana-enterprise `
  --target-port 3000 `
  --ingress 'external' `
  --query properties.configuration.ingress.fqdn

