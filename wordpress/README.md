# Wordpress
A simple wordpress deployment

## Installing the Chart

To install the chart with the release name `my-wordpress`

```console
helm repo add pigeosolutions https://pi-geosolutions.github.io/helm-charts
helm repo update
helm install my-wordpress pigeosolutions/wordpress
```

## Uninstalling the Chart

To uninstall the `my-wordpress` deployment

```console
helm delete my-wordpress
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.
## Config
Please look at the values.yaml

More detailed doc to come one day, maybe.
