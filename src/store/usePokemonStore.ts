import { ref } from 'vue';
import { defineStore } from 'pinia';

import {
  getPokemons,
  loadFavoritesToLocalStorage,
  saveFavorites,
  searchPokemonByName,
} from '../services/get_pokemons';

import { Pokemon } from '../interfaces/Pokemon';
import { capitalizeFirstLetter } from '@/helpers/nameFormatter';

export const usePokemonStore = defineStore('pokemon', () => {
  const pokemons = ref([] as Pokemon[]);
  const favorites = ref(loadFavoritesToLocalStorage());
  const isLoading = ref(false);
  const error = ref(null as string | null);

  const loadPokemons = async () => {
    isLoading.value = true;
    error.value = null;
    try {
      const data = await getPokemons();
      pokemons.value = data;
    } catch (err) {
      error.value = 'Error fetching Pokemons';
      console.error(err);
    } finally {
      isLoading.value = false;
    }
  };

  const searchPokemon = async (name: string) => {
    isLoading.value = true;
    error.value = null;

    const alreadyExists = pokemons.value.some(
      (poke) => poke.name.toLowerCase() === name.toLowerCase()
    );
    if (alreadyExists) {
      alert(`El pokémon ${capitalizeFirstLetter(name)} ya está en la lista.`);
      isLoading.value = false;
      return;
    }

    try {
      const pokemon = await searchPokemonByName(name);
      pokemons.value = [pokemon, ...pokemons.value];
      return pokemon;
    } catch (err) {
      error.value = 'Error searching for Pokémon';
      console.error(err);
    } finally {
      isLoading.value = false;
    }
  };

  const toggleFavorite = (pokemon: Pokemon) => {
    const index = favorites.value.findIndex((fav) => fav.name === pokemon.name);
    if (index === -1) {
      favorites.value.push(pokemon);
    } else {
      favorites.value.splice(index, 1);
    }
    saveFavorites(favorites.value);
  };

  return {
    pokemons,
    favorites,
    isLoading,
    error,
    loadPokemons,
    searchPokemon,
    toggleFavorite,
  };
});
