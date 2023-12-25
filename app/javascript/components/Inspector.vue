<script setup>
import { computed } from 'vue';

const props = defineProps(['modelValue']);
const emit = defineEmits(['update:modelValue']);

function emitUpdate(valueName, value) {
    const newConfig = { ...props.modelValue };
    console.log(typeof newConfig[valueName]);
    const newValue = (newConfig[valueName].constructor) (value);
    console.log(typeof newValue);
    if (newValue) {
        newConfig[valueName] = newValue;
        emit('update:modelValue', newConfig);
    }
}

function getInputTypeFor(propertyName) {
    switch (typeof props.modelValue[propertyName]) {
        case 'number':
            return "number"
        case 'boolean':
            return "checkbox"
        default:
            return "text"
    }
}

const objectKeys = computed(()=>Object.keys(props.modelValue).filter(k => k != "id" && k != "name" && k != "draggable"));

</script>

<template>
    <div class="shrink-0 border-t border-gray-400 px-4 py-6 sm:px-6 lg:w-96 lg:border-l lg:border-t-0 lg:pr-8 xl:pr-6
                bg-gray-100 w-full h-full">
        <h2 class="font-bold text-lg pb-2 border-b-2 border-gray-400">
        Inspector
        </h2>
        <div id="properties" class="pt-4">
            <form v-if="modelValue">
                <div class="pb-4 grid grid-cols-2 border-b-2 border-dashed border-gray-300">
                    <label for="name" class="mr-4 font-semibold flex items-center">Name</label>
                    <input id="name" :value="modelValue.name" type="text"
                        @input="e => emitUpdate('name', e.target.value)"
                        class="ml-6" />

                </div>
                <div v-for="propertyName in objectKeys" class="pt-5 grid grid-cols-2">
                    <label :for="propertyName" class="mr-4 font-semibold flex items-center">{{ propertyName }}</label>
                    <input :id="propertyName" :value="modelValue[propertyName]" :type="getInputTypeFor(propertyName)"
                           @input="e => emitUpdate(propertyName, e.target.value)"
                           class="ml-6" />
                </div>
            </form>
        </div>
    </div>
</template>
