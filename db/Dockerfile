FROM scylladb/scylla

# Adiciona scripts CQL para serem executados no load
COPY db/scripts/create-keyspace.cql /docker-entrypoint-initdb.d/create-keyspace.cql

COPY db/wrapper.sh /wrapper.sh

RUN chmod +x wrapper.sh

ENTRYPOINT ["/wrapper.sh"]