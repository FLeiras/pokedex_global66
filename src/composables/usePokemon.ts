import { storeToRefs } from 'pinia';
import { usePokemonStore } from '../store/usePokemonStore';

export const usePokemon = () => {
  const store = usePokemonStore();
  const { pokemons, isLoading, error } = storeToRefs(store);

  return {
    error,
    isLoading,
    pokemons,
    store,
  };
};
