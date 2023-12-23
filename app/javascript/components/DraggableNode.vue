<script setup>
import { ref, onMounted } from 'vue';

const props = defineProps(['modelValue', 'nodeName']);
const emit = defineEmits(['update:modelValue', 'selected']);

function onMouseDown(event) {
    emit('selected', props.modelValue);
}

function nodeMoved(event) {
    const newConfig = { ...props.modelValue };
    newConfig.x = event.target.attrs.x;
    newConfig.y = event.target.attrs.y;
    emit('update:modelValue', newConfig);
}

function onMouseOverRect(event) {
    document.body.style.cursor = 'pointer';
}

function onMouseOutRect(event) {
    document.body.style.cursor = 'default';
}
</script>

<template>
    <component :is="nodeName" :config="modelValue" @dragmove="nodeMoved" @mousedown="onMouseDown"
               @mouseover="onMouseOverRect" @mouseout="onMouseOutRect"/>
</template>
