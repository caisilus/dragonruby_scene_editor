<script setup>
import { ref, onMounted } from 'vue';

const props = defineProps(['modelValue', 'nodeName']);
const emit = defineEmits(['update:modelValue']);

function emitUpdate(valueName, value) {
    const newConfig = { ...props.modelValue };
    newConfig[valueName] = value;
    emit('update:modelValue', newConfig);
}

</script>

<template>
    <div id="properties">
        <input v-if="modelValue" :value="modelValue.name"
               @input="(e) => emitUpdate('name', e.target.value)" />
        <input v-else disabled />
        <input v-if="modelValue" type="number" :value="modelValue.x"
               @input="(e) => emitUpdate('x', Number(e.target.value))" />
        <input v-else type="number" disabled />
    </div>
</template>
