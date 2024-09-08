<script setup>
import { useRouter } from 'vue-router';

const router = useRouter();

const getStarted = () => {
  router.push('/home');
};
</script>

<template>
  <div class="empty-container">
    <h1>Uh-oh!</h1>
    <h3>You look lost on your journey!</h3>
    <button @click="getStarted">Go back home</button>
  </div>
</template>

<style scoped>
@import '../styles/emptyList.css';
</style>
