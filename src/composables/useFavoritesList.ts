import { ref } from 'vue';
import { usePokemonStore } from '../store/usePokemonStore';
import { Pokemon } from '@/interfaces/Pokemon';

export const useFavoritesList = () => {
  const store = usePokemonStore();
  const { favorites } = store;

  const loading = ref(false);

  const toggleFavorite = (pokemon: Pokemon) => {
    store.toggleFavorite(pokemon);
  };

  return {
    favorites,
    loading,
    toggleFavorite,
  }
};
