# Monitoring Setup

## Install Prometheus + Grafana

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

kubectl create namespace monitoring

helm install prometheus prometheus-community/prometheus --namespace monitoring
helm install grafana grafana/grafana --namespace monitoring
```

## Access Grafana

```bash
kubectl port-forward --namespace monitoring service/grafana 3001:80
```

Open: http://localhost:3001
Username: admin

## Dashboards
- Kubernetes cluster: ID 3119
- Node metrics: ID 1860