# Backups services for geOrchestra infrastructure

Provides backup services for a quite standard geOrchestra infrastructure (containerized). It assumes that the data volumes are file-based volumes (local storage), all under the same common path

## Installing the Chart

To install the chart with the release name `my-backups`

```console
helm repo add pigeosolutions https://pi-geosolutions.github.io/helm-charts
helm repo update
helm install my-backups pigeosolutions/backups
```

## Uninstalling the Chart

To uninstall the `my-backups` deployment

```console
helm delete my-backups
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Config
Please look at the values.yaml

More detailed doc to come one day, maybe.

## Components
### CRON tasks

It uses restic to perform the backups of:

- geOrchestra's OpenLDAP
- geOrchestra's Postgresql applicative DB
- geOrchestra's PostGIS geodata DB (not really standard, but common ingredient)
- geOrchestra's PostGIS datafeeder DB (same)
- Wordpress Mysql DB
- Data volumes. They are expected to be all stored in the same place. Here, you can configure the parent folder, and all subfolders will be considered a volume and backed up.

### backup geoserver datadir as a git repo
There is also an optional backup deployment based on https://github.com/fvanderbiest/docker-volume-git-backup to sync the geoserver_datadir with a git repo.

### Restore console

A deployment provides an shell console, with preconfigured restic access, to explore and restore data. You can optionnally set a SSH remote access, but by default, it is assumed that you will use kubectl to open a shell access to this console.