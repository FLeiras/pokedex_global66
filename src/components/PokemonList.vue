<script setup>
import { onMounted } from 'vue';
import { usePokemon } from '@/composables/usePokemon';

import {
  EmptyList,
  SearchBar,
  FooterNav,
  Loading,
  PokemonCard,
} from '../components/index';

const { isLoading, error, pokemons, store } = usePokemon();

onMounted(() => {
  store.loadPokemons();
});
</script>

<template>
  <div v-if="isLoading">
    <Loading />
  </div>
  <div class="pokemon-list-container" v-else>
    <SearchBar />

    <div class="content">
      <div v-if="error">
        <EmptyList />
      </div>
      <ul class="pokemon-list">
        <PokemonCard
          v-for="pokemon in pokemons"
          :key="pokemon.name"
          :pokemon="pokemon"
        />
      </ul>
    </div>
    <div class="footer-nav">
      <FooterNav />
    </div>
  </div>
</template>

<style scoped>
@import '../styles/pokemonList.css';
</style>
