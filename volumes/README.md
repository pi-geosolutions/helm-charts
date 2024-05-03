# Volumes using local storage

This chart creates PVs that rely on local storage
- an init script is generated from the .Values.directories list
- this script is run by a deployment, to generate the directories on the host FS
- PVs are also generated based on this list
- a few PVCs that were missing are also managed by this script


## Installing the Chart

To install the chart with the release name `my-volumes`

```console
helm repo add pigeosolutions https://pi-geosolutions.github.io/helm-charts
helm repo update
helm install my-volumes pigeosolutions/volumes
```

## Uninstalling the Chart

To uninstall the `my-volumes` deployment

```console
helm delete my-volumes
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.