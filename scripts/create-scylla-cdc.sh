curl -X "POST" "http://localhost:8083/connectors/" \
     -H "Content-Type: application/json" \
     -d '{
           "name": "ScyllaConnector",
           "config": {
             "name": "ScyllaConnector",
             "connector.class": "com.scylladb.cdc.debezium.connector.ScyllaConnector",
             "key.converter": "org.apache.kafka.connect.json.JsonConverter",
             "value.converter": "org.apache.kafka.connect.json.JsonConverter",
             "scylla.cluster.ip.addresses": "scylladb:9042",
             "scylla.name": "MyScyllaCluster",
             "scylla.table.names": "cdc.notifications"
           }
         }'