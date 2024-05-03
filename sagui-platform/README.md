# SAGUI platform

SAGUI is an early warning prototype designed for French Guyana.

The project's code base is hosted on https://github.com/HydroMetGuyane-Hydro-Matters.

The platform is visible on http://sagui.hydro-matters.fr/sagui/

It makes use of the [HYFAA - MGB model](https://github.com/OMP-IRD/hyfaa-scheduler) to compute and predict rivers' flow and height, based on satellite data.


## Installing the Chart

To install the chart with the release name `my-sagui-platform`

```console
helm repo add pigeosolutions https://pi-geosolutions.github.io/helm-charts
helm repo update
helm install my-sagui-platform pigeosolutions/sagui-platform
```

## Uninstalling the Chart

To uninstall the `my-sagui-platform` deployment

```console
helm delete my-sagui-platform
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.