<script setup>
const props = defineProps(['modelValue']);
const emit = defineEmits(['update:modelValue']);

function emitUpdate(valueName, value) {
    const newConfig = { ...props.modelValue };
    newConfig[valueName] = value;
    emit('update:modelValue', newConfig);
}

</script>

<template>
    <div class="shrink-0 border-t border-gray-400 px-4 py-6 sm:px-6 lg:w-96 lg:border-l lg:border-t-0 lg:pr-8 xl:pr-6
                bg-gray-100 w-full h-full">
        <h2 class="font-bold text-lg pb-2 border-b-2">
        Inspector
        </h2>
        <div id="properties" class="pt-4">
            <input v-if="modelValue" :value="modelValue.name"
                @input="(e) => emitUpdate('name', e.target.value)" />
            <input v-else disabled />
            <input v-if="modelValue" type="number" :value="modelValue.x"
                @input="(e) => emitUpdate('x', Number(e.target.value))" />
            <input v-else type="number" disabled />
        </div>
    </div>
</template>
