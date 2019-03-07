package com.beardedman

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class BeardedmanApplication

fun main(args: Array<String>) {
    runApplication<BeardedmanApplication>(*args)
}
