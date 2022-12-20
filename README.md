# automate-ingestion-of-public-data

Automate ingestion of consistently updated public data sources into (ideally) PostgreSQL and derive some result stream, selecting a 10-100 cardinality attribute as a security boundary to be respected by and shared across a simple, external accounts-teams-projects system. 

```bash
>>> sudo -i -u postgres # access `postgres` account 
>>> psql # access PostgreSQL database server
>>> CREATE DATABASE healthdata;
>>> \l # show databases
>>> \c healthdata # change to database `healthdata`
# create table docs https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-create-table/
# datatype docs: https://www.postgresql.org/docs/9.1/datatype-numeric.html
>>> CREATE TABLE IF NOT EXISTS hospitals_reporting_percentage(
    datestamp timestamptz NOT NULL DEFAULT NOW(),
    state TEXT NOT NULL,
    reported INT NOT NULL,
    total INT NOT NULL,
    percentage_reporting REAL NOT NULL
);
>>> \dt # show tables
>>> TRUNCATE TABLE hospitals_reporting_percentage; # delete all rows
>>> DROP TABLE IF EXISTS hospitals_reporting_percentage;
>>> \q # quit PostgreSQL database server
>>> exit # quit `postgres` account
```

```bash
>>> crontab -e # schedule pipeline
```