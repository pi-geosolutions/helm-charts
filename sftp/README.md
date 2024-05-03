# SFTP 

Deploys SFTP-related services to use around geOrchestra

## Installing the Chart

To install the chart with the release name `my-sftp`

```console
helm repo add pigeosolutions https://pi-geosolutions.github.io/helm-charts
helm repo update
helm install my-sftp pigeosolutions/sftp
```

## Uninstalling the Chart

To uninstall the `my-sftp` deployment

```console
helm delete my-sftp
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.
## Config
Please look at the values.yaml

More detailed doc to come one day, maybe.

## Components
### SFTP console
Runs a deployment to which one can connect using SSH.

User roles are taken from the LDAP records (only accepting users belonging to role `SSH_USER`).

Depending on the image used, the container is quite rich on GIS-related CLI commands, including python support.

It also runs a CRON daemon, so that users can also schedule some processes.

For specific needs, you can also define some sudoers profiles (see `sudoers` config key).

### LDAP userid cronjob

This is a cron task that sets in the LDAP a posix user ID for the authorized users. This is not handle by default by geOrchestra's LDAP account, hence this addon.

For people to be able to log in using SSH, they will need their LDAP account to possess a user ID.

It can report its current status to a prometheus gateway service, for monitoring.