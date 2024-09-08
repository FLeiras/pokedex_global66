<script setup>
import { useRouter, useRoute } from "vue-router";

const router = useRouter();
const route = useRoute();

const changeView = (path) => {
  router.push(`/${path}`);
};
</script>

<template>
  <div class="footer-nav">
    <button class="nav-btn all-btn" :class="{ active: route.name === 'home', inactive: route.name !== 'home' }" @click="changeView('home')">
      <img src="../assets/icon_all.png" alt="" />
    </button>
    <button class="nav-btn favorites-btn" :class="{ active: route.name === 'favorites', inactive: route.name !== 'favorites' }" @click="changeView('favorites')">
      <img src="../assets/favorites_icon.png" alt="" />
    </button>
  </div>
</template>

<style scoped>
@import "../styles/footerNav.css";
</style>
