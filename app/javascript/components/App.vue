<script setup>
    import { ref, reactive, onMounted } from "vue";
    import DraggableNode from "./DraggableNode.vue";
import Inspector from "./Inspector.vue";

    const configStage = ref({
        width: 500,
        height: 500,
    });

    const configBox2 = ref({
        x: 500,
        y: 250,
        width: 100,
        height: 50,
        fill: 'red',
        stroke: 'black',
        strokeWidth: 4,
        draggable: true,
        name: "Red box"
    })

    const configBox = ref({
        x: 250,
        y: 250,
        width: 100,
        height: 50,
        fill: '#00D2FF',
        stroke: 'black',
        strokeWidth: 4,
        draggable: true,
        name: "Blue box"
    });

    const draggableConfigs = [configBox, configBox2];
    draggableConfigs.forEach((config, index) => config.value.id = index);

    const selectedBoxConfig = reactive({selected: null});

    const scene = ref(null)
    // here you should set the stage size depending on div element size
    onMounted(() => {
        const width = scene.value.clientWidth;
        const height = scene.value.clientHeight;
        configStage.value.width = width;
        configStage.value.height = height;
    });

    function nodeSelected(nodeConfig) {
        const id = nodeConfig.id;
        selectedBoxConfig.selected = draggableConfigs[id];
    }
</script>

<template>
    <div ref="scene" class="border-gray-500 border-2">
        <Inspector v-model="selectedBoxConfig.selected" />
        <v-stage :config="configStage">
            <v-layer>
                <DraggableNode v-model="configBox" node-name="v-rect" @selected="nodeSelected" />
                <DraggableNode v-model="configBox2" node-name="v-rect" @selected="nodeSelected" />
            </v-layer>
        </v-stage>
    </div>
</template>
