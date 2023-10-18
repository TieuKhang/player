package com.intuit.player.jvm.core.bridge.serialization.serializers

import com.intuit.player.jvm.core.bridge.Node
import com.intuit.player.jvm.core.bridge.NodeWrapper
import com.intuit.player.jvm.core.bridge.serialization.format.serializer
import com.intuit.player.jvm.core.player.PlayerException
import kotlinx.serialization.KSerializer
import kotlinx.serialization.descriptors.PolymorphicKind
import kotlinx.serialization.descriptors.StructureKind
import kotlinx.serialization.serializer
import kotlin.reflect.KProperty

internal class NodeSerializableField<T> private constructor(val strategy: CacheStrategy, private val provider: () -> Node, private val serializer: KSerializer<T>, private val name: String? = null) {

    constructor(
        provider: () -> Node,
        serializer: KSerializer<T>,
        strategy: CacheStrategy? = null,
        name: String? = null,
    ) : this(
        strategy ?: strategy ?: when (serializer.descriptor.kind) {
            is StructureKind,
            is PolymorphicKind -> CacheStrategy.Smart
            else -> CacheStrategy.None
        },
        provider,
        serializer,
        name,
    )

    enum class CacheStrategy {
        None,
        Smart,
        Full,
    }

    /** Cache of container [Node] that will reset the [value] cache if out-of-date with the [provider] */
    private var cache: Node = provider(); get() {
        val provided = provider()
        if (provided.nativeReferenceEquals(field)) field else {
            field = provided
            value = null
        }

        return field
    }

    /** Cache of the [T] value, along with the backing [Node] for objects */
    private var value: Pair<Node?, T>? = null

    operator fun getValue(thisRef: Any?, property: KProperty<*>): T {
        // early exit if we have a value and explicitly using the cache
        value?.takeIf { strategy == CacheStrategy.Full && !provider().isReleased() }?.let { (_, value) ->
            return value
        }

        val key = name ?: property.name

        // will reset cache and value if mismatch
        val node = cache

        // early exit if we have a value still and referentially match the backing [Node]
        value?.takeIf { strategy == CacheStrategy.Smart }
            ?.takeIf { (backing) -> backing?.nativeReferenceEquals(node[key]) == true }
            ?.let { (_, value) -> return value }

        // TODO: Could support null values by checking descriptor
        // else get and deserialize the value
        return node
            .getSerializable(key, serializer)
            ?.also { value = node.getObject(key) to it }
            ?: throw PlayerException("""Could not deserialize "$key" as "${serializer.descriptor}"""")
    }

    companion object {
        inline operator fun <reified T> invoke(noinline provider: () -> Node, strategy: CacheStrategy? = null, name: String? = null) =
            NodeSerializableField(provider, serializer<T>(), strategy, name)

        fun <T> NodeWrapper.NodeSerializableField(serializer: KSerializer<T>, strategy: CacheStrategy? = null, name: String? = null) =
            NodeSerializableField(::node, serializer, strategy, name)

        inline fun <reified T> NodeWrapper.NodeSerializableField(strategy: CacheStrategy? = null, name: String? = null) =
            NodeSerializableField(node.format.serializer<T>(), strategy, name)
    }
}
