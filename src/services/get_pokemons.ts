import pokemonApi from '../api/pokemon_api';
import { Pokemon } from '../interfaces/Pokemon';

const delay = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));

export const getPokemons = async (): Promise<Pokemon[]> => {
  try {
    const response = await pokemonApi.get('/pokemon?limit=10');
    const results = response.data.results;

    const pokePromise = results.map(
      async (pokemon: { name: string; url: string }) => {
        const pokemonDetails = await pokemonApi.get(pokemon.url);
        const data = pokemonDetails.data;
        return {
          name: data.name,
          image: data.sprites.other.home.front_default,
          types: data.types.map((typeInfo: any) => typeInfo.type.name),
          weight: data.weight,
          height: data.height,
        } as Pokemon;
      }
    );

    const pokemons: Pokemon[] = await Promise.all(pokePromise);
    await delay(3000);
    return pokemons;
  } catch (error) {
    console.error('Error fetching Pokemons:', error);
    throw new Error('Failed to fetch Pokemons');
  }
};

export const searchPokemonByName = async (name: string): Promise<Pokemon> => {
  try {
    const response = await pokemonApi.get(`/pokemon/${name}`);
    const data = response.data;

    const pokemon: Pokemon = {
      name: data.name,
      image: data.sprites.other.home.front_default,
      types: data.types.map((typeInfo: any) => typeInfo.type.name),
      weight: data.weight,
      height: data.height,
    };

    return pokemon;
  } catch (error) {
    console.error('Error searching for Pokémon:', error);
    throw new Error('Failed to fetch Pokémon by name');
  }
};

export const loadFavoritesToLocalStorage = () => {
  const savedFavorites = localStorage.getItem('pokemonsFavorites');
  if (savedFavorites) {
    return JSON.parse(savedFavorites) as Pokemon[];
  }
  return [];
};

export const saveFavorites = (favorites: Pokemon[]) => {
  localStorage.setItem('pokemonsFavorites', JSON.stringify(favorites));
};
