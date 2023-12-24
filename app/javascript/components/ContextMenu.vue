<script setup>
const { actions, x, y } = defineProps(['actions', 'x', 'y']);
const emit = defineEmits(['action-clicked']);

function emitAction(action) {
    emit('action-clicked', action);
}

</script>

<template>
    <div class="absolute z-50 bg-white border-2 border-gray-300 p-2 flex flex-col"
         :style="{ top: y + 'px', left: x + 'px' }">
        <button v-for="action in actions" @click.stop="emitAction(action.action)"
                class="border-2 border-gray-100 hover:bg-gray-50 my-1 px-1">
            {{ action.name }}
        </button>
    </div>
</template>
