package com.hartwig

import io.micronaut.configuration.kafka.annotation.KafkaClient
import io.micronaut.configuration.kafka.annotation.KafkaKey
import io.micronaut.configuration.kafka.annotation.Topic

@KafkaClient
interface KafkaProducer {

    fun produce(@Topic topic: String, @KafkaKey key: String, productDto: String)

}