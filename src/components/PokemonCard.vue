<script setup>
import { PokemonModal } from '../components/index';
import { usePokemonCard } from '@/composables/usePokemonCard';

const props = defineProps({
  pokemon: {
    type: Object,
    required: true,
  },
});

const {
  isFavorite,
  pokeName,
  modalVisible,
  starEmpty,
  starFilled,
  openModal,
  closeModal,
  toggleFavorite,
} = usePokemonCard(props);
</script>

<template>
  <div class="pokemon-card" @click.stop="openModal">
    <span class="pokemon-name">{{ pokeName }}</span>
    <img
      @click.stop="toggleFavorite"
      :src="isFavorite ? starFilled : starEmpty"
      :alt="isFavorite ? 'Favorite' : 'Not Favorite'"
      class="favorite-star"
    />
    <PokemonModal
      :visible="modalVisible"
      :pokemon="pokemon"
      @close="closeModal"
    />
  </div>
</template>

<style scoped>
@import '../styles/pokemonCard.css';
</style>
