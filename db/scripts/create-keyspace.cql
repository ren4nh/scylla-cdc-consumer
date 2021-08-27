CREATE KEYSPACE IF NOT EXISTS cdc WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

USE cdc;

create table if not exists cdc.notifications(id UUID, type VARCHAR, payload VARCHAR, primary key(
id)) WITH cdc = {'enabled': true};