<script setup lang="ts">
import { useRouter } from 'vue-router';

const router = useRouter();


const getStarted = () => {
  router.push('/home');
};
</script>

<template>
  <div class="welcome-container">
    <div class="circle-background"></div>
    <img src="../assets/pikachu.svg" alt="Pokédex" class="welcome-image" />
    <h1>Welcome to Pokédex</h1>
    <h3>The digital encyclopedia created by Professor Oak is an invaluable tool to Trainers in the Pokémon world.</h3>
    <button @click="getStarted">Get started</button>
  </div>
</template>

<style scoped>
@import '../styles/welcome.css';
</style>
