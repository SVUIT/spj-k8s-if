# Setting Up ELK Stack on Kubernetes

|> [Setting Up ELK Stack on Kubernetes: A Step-by-Step Guide](https://surajsoni3332.medium.com/setting-up-elk-stack-on-kubernetes-a-step-by-step-guide-227690eb57f4)

> [!IMPORTANT]
> MAKE SURE ALL YOUR RESOURCES ARE OF THE SAME VERSION THAT IS ELASTICSEARCH, KIBANA, LOGSTASH & FILEBEAT

## 1. Installing Operator

Install [custom resource definitions](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/) and Install the operator with its RBAC rules

```bash
kubectl create -f https://download.elastic.co/downloads/eck/2.2.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.2.0/operator.yaml
```
## 2. Setting Up Elasticsearch

Elasticsearch is an open source distributed, RESTful search and analytics engine, scalable data store, and vector database capable of addressing a growing number of use cases.

```bash
kubectl apply -f elasticsearch.yaml
```

To monitor cluster health and creation progress apply this command

```bash
kubectl get elasticsearch
```
Request Elasticsearch access: A ClusterIP Service is automatically created for your cluster

```bash
kubectl get service quickstart-es-http
```

Get the credentials: A default user named `elastic` is automatically created with the password stored in a Kubernetes secret

```bash
PASSWORD=$(kubectl get secret quickstart-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')
```

Request the Elasticsearch endpoint: From your local workstation, use the following command in a separate terminal

```bash
kubectl port-forward service/quickstart-es-http 9200
```

```bash
curl -u "elastic:$PASSWORD" -k "https://localhost:9200"
```

## 3. Deploying Logstash

Logstash is an open source server-side data processing pipeline that ingests data from a multitude of sources, transforms it, and then sends it to your favorite "stash".

```bash
kubectl apply -f logstash.yaml
kubectl apply -f config.yaml
```

Check logstash status

```bash
kubectl get logstash
```

## 4. Setting Up Kibana

Kibana provides a web interface to visualize logs stored in Elasticsearch.

```bash
kubectl apply -f kibana.yaml
```

Monitor Kibana health and creation progress: Similar to Elasticsearch, you can retrieve details about Kibana instances

```bash
kubectl get kibana
```

Access Kibana: A `ClusterIP` Service is automatically created for Kibana

```bash
kubectl get service quickstart-kb-http
```

Use `kubectl port-forward` to access Kibana by `https://localhost:5601` in browser

```bash
kubectl port-forward service/quickstart-kb-http 5601
```

Login as the `elastic` user. The password can be obtained with the following command

```bash
kubectl get secret quickstart-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
```

## 5. Deploying Filebeat

Filebeat is a lightweight shipper for forwarding and centralizing log data.

```bash
kubectl apply -f filebeat.yaml
```

Retrieve details about the Filebeat

```bash
kubectl get beat
```

Access logs of the filebeat pod

```bash
kubectl logs -f quickstart-beat-filebeat-xxxxc
```
