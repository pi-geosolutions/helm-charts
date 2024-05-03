# Volumes using local storage

This chart creates PVs that rely on local storage
- an init script is generated from the .Values.directories list
- this script is run by a deployment, to generate the directories on the host FS
- PVs are also generated based on this list
- a few PVCs that were missing are also managed by this script

