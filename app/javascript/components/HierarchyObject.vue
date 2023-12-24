<script setup>
import ContextMenu from './ContextMenu.vue';
import { ref, watch, watchPostEffect } from 'vue';

const { object, selected } = defineProps(["object", "selected"]);
const emit = defineEmits(["object-name-updated", "object-selected"]);

const menuActions = ref([
    {
        name: "Rename",
        action: "rename"
    },
    {
        name: "Delete",
        action: "delete"
    }
]);

const input = ref(null);

const editing = ref(false);
const showMenu = ref(false);
const menuX = ref(0);
const menuY = ref(0);

function performContextAction(action) {
    showMenu.value = false;
    switch(action) {
        case "rename":
            startEditing();
            break;
        case "delete":
            console.log("delete");
            break;
    }
}

function emitObjectNameUpdate(newName) {
    const newConfig = { ...object.value };
    newConfig.name = newName;
    emit('object-name-updated', newConfig);
}

function showContextMenu(event) {
   showMenu.value = true;
   menuX.value = event.clientX;
   menuY.value = event.clientY;
}

function closeContextMenu() {
    showMenu.value = false;
}

function startEditing() {
    editing.value = true;
    emit('object-selected', object);
}

function stopEditing(shouldSave=false) {
    editing.value = false;
    if (shouldSave) {
        emitObjectNameUpdate(input.value.value);
    }
}

watch(editing, () => {
    if (editing.value && input.value) {
        input.value.focus();
        input.value.select();
    }
}, {flush: 'post'});

</script>

<template>
    <ContextMenu v-if="showMenu" :x="menuX" :y="menuY" :actions="menuActions" @action-clicked="performContextAction" />
    <div v-if="showMenu" @click="closeContextMenu" class=" fixed top-0 left-0 w-screen h-screen z-49"></div>
    <div @click.stop="e => $emit('object-selected', object)" @contextmenu.prevent.stop="showContextMenu"
        class="p-2 my-2 border-2 border-gray-400 hover:bg-gray-200 font-semibold"
        :class="{'bg-gray-300 hover:bg-gray-300': selected}">
        <p v-if="!editing" class="cursor-pointer ">
            {{ object.value.name }}
        </p>
        <input ref="input" v-if="editing" :value="object.value.name"
               class="px-0 py-0 border-0 bg-gray-300 focus:outline-0"
               @focusin="test" @focusout="e => stopEditing()"
               @keyup.enter="e => stopEditing(true)" />
    </div>
</template>
