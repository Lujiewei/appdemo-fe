<template>
  <div>
    <nav-view />
    <h1>Home{{ store.counte }}</h1>
    <button @click="store.increment">++</button>
  </div>
</template>

<script lang="ts" setup>
import NavView from '@/components/NavView.vue'
import { useCounterStore } from '@/store/index'
const store = useCounterStore()
</script>
<style lang="less" scoped></style>
