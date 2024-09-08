import { ref } from 'vue';
import { usePokemonStore } from '../store/usePokemonStore';

export const useSearchBar = () => {
  const searchQuery = ref('');

  const store = usePokemonStore();

  const handleSearch = async () => {
    if (!searchQuery.value.trim()) {
      return;
    }

    try {
      await store.searchPokemon(searchQuery.value.trim().toLowerCase());
    } catch (err) {
      console.error('Error during search:', err);
    } finally {
      searchQuery.value = '';
    }
  };

  return {
    searchQuery,
    handleSearch,
  }
};
