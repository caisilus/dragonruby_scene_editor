<script setup>
    import { ref } from 'vue'
    const count = ref(0)
</script>

<template>
  <div id="counter">
    <button class="text-red-600" @click="count++">
        Increment counter!
    </button>
    <p class="text-green-600">
        Counter: {{ count }}
    </p>
  </div>
</template>
