# mviewer 

Deploys mviewer, mviewerstudio and a basic ElasticSearch service for search capabilities.

## Config
Please look at the values.yaml

More detailed doc to come one day, maybe.

## ingress
The ingress config is quite basic. Most of it is done on the values.yaml definition. 

For instance, if serving the mviewer apps behind a geOrchestra security proxy, you will want to comment the mviewer and mviewerstudio endpoints. And maybe keep the ES search endpoint if you want to use it.