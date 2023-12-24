<script setup>
    import HierarchyObject from './HierarchyObject.vue';

    const props = defineProps(['objects', 'selectedObject']);
    const emit = defineEmits(['object-clicked', 'object-name-updated']);

    function objectSelected(object) {
        emit('object-clicked', object.value);
    }

    function emitObjectNameUpdate(newConfig) {
        emit("object-name-updated", newConfig.id, newConfig.name);
    }

    function isObjectSelected(object) {
        return props.selectedObject && object.value.id == props.selectedObject.id;
    }
</script>

<template>
    <div class="bg-gray-100 border-b border-gray-400 px-4 py-6 sm:px-6
                lg:pl-8 xl:w-64 xl:shrink-0 xl:border-b-0 xl:border-r xl:pl-6">
        <h2 class="font-bold text-lg">
        Hierarchy
        </h2>
        <ul>
            <li v-for="object in objects" :id="object.value.id">
                <HierarchyObject :object="object" :selected="isObjectSelected(object)"
                @object-selected="objectSelected" @object-name-updated="emitObjectNameUpdate" />
            </li>
        </ul>
    </div>
</template>
