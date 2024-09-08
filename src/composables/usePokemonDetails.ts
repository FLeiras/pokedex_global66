import { computed } from 'vue';
import { usePokemonStore } from '../store/usePokemonStore';
import { copyToClipboard } from '@/helpers/copy_to_clipboard';
import { capitalizeFirstLetter } from '@/helpers/nameFormatter';
import starFilled from '../assets/star2.png';
import starEmpty from '../assets/star.png';

export const usePokemonDetails = (props: any, emit: any) => {
  const pokeName = capitalizeFirstLetter(props.pokemon.name);
  const pokeTypes = props.pokemon.types.map((type: string[]) =>
    capitalizeFirstLetter(type)
  );

  const store = usePokemonStore();
  const isFavorite = computed(() =>
    store.favorites.some((fav) => fav.name === props.pokemon.name)
  );

  const toggleFavorite = () => {
    store.toggleFavorite(props.pokemon);
  };

  const copyInfo = () => {
    copyToClipboard(props.pokemon);
  };

  const closeModal = () => {
    emit('close');
  };

  return {
    pokeName,
    pokeTypes,
    isFavorite,
    starFilled,
    starEmpty,
    toggleFavorite,
    copyInfo,
    closeModal,
  };
};
