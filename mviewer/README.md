# mviewer 

Deploys mviewer, mviewerstudio and a basic ElasticSearch service for search capabilities.

## Installing the Chart

To install the chart with the release name `my-mviewer`

```console
helm repo add pigeosolutions https://pi-geosolutions.github.io/helm-charts
helm repo update
helm install my-mviewer pigeosolutions/mviewer
```

## Uninstalling the Chart

To uninstall the `my-mviewer` deployment

```console
helm delete my-mviewer
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.
## Config
Please look at the values.yaml

More detailed doc to come one day, maybe.

## ingress
The ingress config is quite basic. Most of it is done on the values.yaml definition. 

For instance, if serving the mviewer apps behind a geOrchestra security proxy, you will want to comment the mviewer and mviewerstudio endpoints. And maybe keep the ES search endpoint if you want to use it.