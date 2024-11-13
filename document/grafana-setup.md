# Deploy Grafana on Kubernetes

|> [Deploy Grafana on Kubernetes](https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/)

## 1. Deploying Persistent Volume Claim (PVC)

```bash
kubectl apply -f pvc.yaml
```

## 2. Deploying Grafana as Deployment

```bash
kubectl apply -f grafana.yaml
```

## 3. Deploy Service (SVC)

```bash
kubectl apply -f svc.yaml
```