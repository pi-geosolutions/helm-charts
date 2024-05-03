# Database services for geOrchestra infrastructure

Provides database services for a quite standard geOrchestra infrastructure (containerized). 

## Config
Please look at the values.yaml

More detailed doc to come one day, maybe.

## Components
### PostgreSQL databases
Those are quite common geOrchestra databases, but with a customized setup. I prefer those over bitnami's for instance, they are simpler for me to understand and maintain.

- geOrchestra's Postgresql applicative DB
- geOrchestra's PostGIS geodata DB (not really standard, but common ingredient)
- geOrchestra's PostGIS datafeeder DB (same)


### ldap2pg cron job

This is an optional additionnal service. It runs https://github.com/georchestra/ldap2pg.

It allows one to manage the geodata DB's permissions based on LDAP roles.