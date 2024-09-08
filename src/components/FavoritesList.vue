<script setup>
import { onMounted } from 'vue';
import { useFavoritesList } from '@/composables/useFavoritesList';

import {
  EmptyList,
  SearchBar,
  FooterNav,
  Loading,
  PokemonCard,
} from '../components/index';

const { loading, favorites, toggleFavorite } = useFavoritesList();

onMounted(() => {
  loading.value = true;
  setTimeout(() => {
    loading.value = false;
  }, 1000);
});
</script>

<template>
  <div class="pokemonFav-list-container">
    <div class="search-bar-container">
      <SearchBar class="searchBar searchBar-Fav" />
    </div>
    <div v-if="loading">
      <Loading />
    </div>
    <div v-else-if="!favorites.length">
      <EmptyList />
    </div>
    <ul v-else class="pokemonFav-list">
      <PokemonCard
        v-for="pokemon in favorites"
        :key="pokemon.name"
        :pokemon="pokemon"
        @toggle-favorite="toggleFavorite"
      />
    </ul>
  </div>
  <FooterNav v-if="favorites.length" />
</template>

<style scoped>
@import '../styles/favoritesList.css';
</style>
