Projeto utilizado como estudo da integração do Scylla CDC Connect com o Apache Kafka

## Como rodar

```
docker-compose up -d --build
```

Acessar a [url](http://localhost:9021) e visualizar se possui um connect rodando em caso de não aparecer nenhum seguir esse [tutorial](https://github.com/scylladb/scylla-cdc-source-connector/blob/master/README-QUICKSTART.md#connector-configuration)


Após a configuração, realizar alguma modificação na tabela alvo. Ex:

```
insert into cdc.notifications(id,type,payload) values(29409485-e5df-4103-8df0-58c3e9ed4e60, 'INSERT', '"{\"product\":{\"name\": \"Café\",\"sku\":\"AAA123\",\"price\":10.99,\"brand\":\"Melita\",\"stock\":5,\"image\":\"http://localhost:8080\"}}"');
```

A aplicação irá criar 3 topicos diferentes para cada tipo de operação.

- create-product
- update-product
- delete-product

Depois de realizar algumas operações no banco como insert, delete e update. Deve ser verificado se as mensagens foram roteadas com sucesso para seu respectivo tópico. O mesmo pode ser feito através do control center ou de uma ferramenta como o [Conduktor](https://www.conduktor.io/download/)


## Links uteis

- [Scylla CDC Connector](https://github.com/scylladb/scylla-cdc-source-connector)
- [Kafka](https://docs.confluent.io/platform/current/quickstart/ce-docker-quickstart.html)
- [Kafka Connect](https://docs.confluent.io/platform/current/installation/docker/installation.html)