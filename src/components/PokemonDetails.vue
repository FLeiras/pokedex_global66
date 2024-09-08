<script setup>
import { usePokemonDetails } from '../composables/usePokemonDetails';

const props = defineProps({
  pokemon: {
    type: Object,
    required: true,
  },
  visible: {
    type: Boolean,
    required: true,
  },
});

const emit = defineEmits(['close']);

const {
  pokeName,
  pokeTypes,
  isFavorite,
  starFilled,
  starEmpty,
  toggleFavorite,
  copyInfo,
  closeModal,
} = usePokemonDetails(props, emit);
</script>

<template>
  <div v-if="visible" class="modal-overlay">
    <div class="modal-content">
      <div class="modal-header">
        <img
          src="../assets/close-modal.png"
          alt="Close Modal"
          class="close-button"
          @click.stop="closeModal"
        />
        <img :src="pokemon.image" alt="Pokemon Image" class="pokemon-image" />
      </div>
      <div class="modal-body">
        <h2><strong>Name:</strong> {{ pokeName }}</h2>
        <hr class="separator" />
        <p><strong>Weight:</strong> {{ pokemon.weight }}</p>
        <hr class="separator" />
        <p><strong>Height:</strong> {{ pokemon.height }}</p>
        <hr class="separator" />
        <p><strong>Types:</strong> {{ pokeTypes.join(', ') }}</p>
        <div class="modal-footer">
          <button @click="copyInfo">Share to my friends</button>
          <img
            @click="toggleFavorite"
            :src="isFavorite ? starFilled : starEmpty"
            :alt="isFavorite ? 'Remove from Favorites' : 'Add to Favorites'"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
@import '../styles/pokemonModal.css';
</style>
