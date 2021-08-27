package com.hartwig

import com.fasterxml.jackson.module.kotlin.jacksonObjectMapper
import io.micronaut.configuration.kafka.annotation.KafkaKey
import io.micronaut.configuration.kafka.annotation.KafkaListener
import io.micronaut.configuration.kafka.annotation.OffsetReset
import io.micronaut.configuration.kafka.annotation.Topic


@KafkaListener(groupId = "cdcListener", offsetReset = OffsetReset.EARLIEST)
class CdcListener(private val producer: KafkaProducer) {

    @Topic("MyScyllaCluster.cdc.notifications")
    fun listen(@KafkaKey key: String, message : String?) {
        if (message != null) {
            val mapper = jacksonObjectMapper()
            val json = mapper.readTree(message)
            val payload = json.get("payload")
            when (payload?.get("op")?.asText()) {
                "c" -> payload.get("after")?.let { producer.produce("create-product", key, it.toString()) }
                "u" -> payload.get("after")?.let { producer.produce("update-product", key, it.toString()) }
                "d" -> payload.get("before")?.let { producer.produce("delete-product", key, it.toString())  }
                else -> {
                    println("Operação não encontrada")
                }
            }
        }
    }
}