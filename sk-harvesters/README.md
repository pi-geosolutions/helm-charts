# SK harvesters 

Deploys Slovak data harvesters.

Those are services that were designed to collect data from some national services. Data that could not be used directly.  
Those harvesters will collect the datasets on a regular basis and store them in a Postgresql database. 

In its current state, the chart supports:
- [evucsk health services harvester](https://gitlab.com/po-kraj-sk/evucsk-harvester)
- [upsvar Labour office harvester](https://gitlab.com/po-kraj-sk/upsvar-harvester)
- [statsoffice harvester](https://gitlab.com/po-kraj-sk/so-harvester)

## Installing the Chart

To install the chart with the release name `my-sk-harvesters`

```console
helm repo add pigeosolutions https://pi-geosolutions.github.io/helm-charts
helm repo update
helm install my-sk-harvesters pigeosolutions/sk-harvesters
```

## Uninstalling the Chart

To uninstall the `my-sk-harvesters` deployment

```console
helm delete my-sk-harvesters
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.
## Config
Please look at the values.yaml

More detailed doc to come one day, maybe.

## Checking harvesters' status

You can provide a prometheus gateway endpoint, for reporting of the latest status.

The harvesters themselves store some status information in the database.

The logs are stored in a volume, which potentially allows non-very-much-privileged users to see how it went (they need access to this volume, though).