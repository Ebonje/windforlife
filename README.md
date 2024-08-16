
# Helm Chart Fixing Issues
1. we'll need to fix any syntax or structural errors in the Helm chart. 

This typically involves:

Ensuring Chart.yaml, values.yaml, and template files are correctly formatted.

Correcting any invalid Kubernetes object specifications.

Making sure that required fields and values are properly defined.

We'll use Helm's --dry-run 

template commands to validate our fixes:
```
helm install --dry-run --debug myrelease ./charts/windforlife
```
replace path-to-chart with the actual path to the chart

```
helm template myrelease ./charts/windforlife
```

2. ***Fix Environment Variables Injection***

 I ensure that environment variables defined in _values.yaml_ are properly injected into the deployment template. 
 by adjusting the ***deployment.yaml***


3. ***Add PostgreSQL Environment Variables***

We add the required PostgreSQL environment variables to the _deployment.yaml_ and update the _values.yaml_
and template file to inject POSTGRESQL_HOST, POSTGRESQL_USER

4. ***Ensure Application Starts After PostgreSQL***

  We Use a readinessProbe and livenessProbe with httpGet request to the PostgreSQL service or an init container to delay the application startup until PostgreSQL is ready.

  
5. ***Make PostgreSQL Chart Dependency Optional***

We Update values.yaml to include a flag for using an external PostgreSQL instance.

by using a conditional in the Helm templates that checks a value in values.yaml to decide whether to include the PostgreSQL chart.

6. ***Update Ingress for Kubernetes 1.19+***

 We remove deprecated fields and use the networking.k8s.io/v1 API version

7. ***Set Resource Limits to Prevent OOM Kills***

 I define resource limits and requests in the deployment
add resources requests and resources limits to the container specifications
and made modification in the _values.yaml file_