Setting Up the ELK Stack on Kubernetes Using Helm
This guide provides step-by-step instructions to deploy the ELK Stack (Elasticsearch, Logstash, and Kibana) on a Kubernetes cluster using Helm.

Prerequisites
- Helm: Ensure Helm is installed on your local machine.
Kubernetes: A running Kubernetes cluster (this guide uses Minikube).
- kubectl: Kubernetes command-line tool installed and configured.
## Add the Elastic Helm Repository
- Add the official Elastic Helm repository to fetch the necessary charts:

```bash
helm repo add elastic https://helm.elastic.co
```
To verify the repository has been added successfully, search for available Elastic charts:
```bash
helm search repo elastic
```

## Create a Namespace
Create a dedicated namespace for the logging components:
```bash
kubectl create namespace logging
```
## Deploy the ELK Components
Deploy each component of the ELK Stack using Helm charts. Ensure you have the appropriate values.yml configuration files for each component.

### Elasticsearch:
```bash
 helm install elasticsearch elastic/elasticsearch -f values.yml -n logging 
```

### Filebeat:
```bash
 helm install filebeat elastic/filebeat -f values.yml -n logging 
```
### Logstash:
```bash
 helm install logstash elastic/logstash -f values.yml -n logging 
```

### Kibana:
```bash
 helm install kibana elastic/kibana -f values.yml -n logging
``` 
Note: Replace values.yml with the path to your specific configuration files for each component.

## References
[How to install Elastic Stack using HELM into Kubernetes](https://medium.com/@davis.angwenyi/how-to-install-elastic-search-using-helm-into-kubernetes-de1fb1011076)

[Helm](https://helm.sh/docs/intro/install/)

[minikube](https://kubernetes.io/vi/docs/tasks/tools/install-minikube/)

### Another project 

[Docker with elk stack](https://github.com/Thanh8804/ELK-Stack.git)