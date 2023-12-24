<script setup>
    import { ref, reactive, onMounted } from "vue";
    import DraggableNode from "./DraggableNode.vue";
    import Inspector from "./Inspector.vue";
    import Hierarchy from "./Hierarchy.vue";

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

    const draggableConfigs = ref([configBox, configBox2]);
    draggableConfigs.value.forEach((config, index) => config.value.id = `config${index}`);

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
        const index = getIndexById(nodeConfig.id)
        selectedBoxConfig.selected = draggableConfigs.value[index];
    }

    function renameObject(id, newName) {
        const index = getIndexById(id);
        draggableConfigs.value[index].value.name = newName;
    }

    function getIndexById(id) {
        const match = id.match(/^config(\d+)$/);

        if (!match) { return; }

        return parseInt(match[1]);
    }
</script>

<template>
    <div class="mx-auto w-full grow lg:flex xl:px-2">
        <!-- Left sidebar & main wrapper -->
        <div class="flex-1 xl:flex">
            <!-- Left column area -->
            <Hierarchy :objects="draggableConfigs" :selected-object="selectedBoxConfig.selected"
                        @object-clicked="nodeSelected" @object-name-updated="renameObject" />

            <div class="bg-gray-100 px-4 py-6 sm:px-6 lg:pl-8 xl:flex-1 xl:pl-6">
                <!-- Main area -->
                <div ref="scene" class="bg-white h-full border-gray-600 border-2">
                    <v-stage :config="configStage">
                        <v-layer>
                            <DraggableNode v-model="configBox" node-name="v-rect" @selected="nodeSelected" />
                            <DraggableNode v-model="configBox2" node-name="v-rect" @selected="nodeSelected" />
                        </v-layer>
                    </v-stage>
                </div>
            </div>
        </div>

        <Inspector v-model="selectedBoxConfig.selected" />
        <!-- Right column area -->
    </div>
</template>
