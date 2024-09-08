import { computed, ref } from 'vue';
import { storeToRefs } from 'pinia';
import { usePokemonStore } from '../store/usePokemonStore';
import { capitalizeFirstLetter } from '../helpers/nameFormatter';

import starFilled from '../assets/star2.png';
import starEmpty from '../assets/star.png';

export const usePokemonCard = (props: any) => {
  const store = usePokemonStore();
  const { favorites } = storeToRefs(store);

  const pokeName = capitalizeFirstLetter(props.pokemon.name);
  const modalVisible = ref(false);

  const isFavorite = computed(() => {
    return favorites.value.some((fav) => fav.name === props.pokemon.name);
  });

  const toggleFavorite = () => {
    store.toggleFavorite(props.pokemon);
  };

  const openModal = () => {
    modalVisible.value = true;
  };

  const closeModal = () => {
    modalVisible.value = false;
  };

  return {
    starEmpty,
    starFilled,
    favorites,
    pokeName,
    modalVisible,
    isFavorite,
    toggleFavorite,
    openModal,
    closeModal,
  };
};
