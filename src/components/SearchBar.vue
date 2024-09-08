<script setup>
import { useSearchBar } from '@/composables/useSearchBar';

const { searchQuery, handleSearch } = useSearchBar();
</script>

<template>
  <div class="search-bar">
    <div class="search-icon" @click="handleSearch">
      <img src="../assets/search.png" alt="Buscar" />
    </div>
    <input
      type="text"
      v-model="searchQuery"
      placeholder="Search"
      @keyup.enter="handleSearch"
    />
  </div>
</template>

<style scoped>
@import '../styles/searchBar.css';
</style>
