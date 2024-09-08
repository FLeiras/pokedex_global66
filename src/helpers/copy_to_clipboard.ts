import { Pokemon } from '@/interfaces/Pokemon';

export const copyToClipboard = (pokemon: Pokemon) => {
  const text = `${pokemon.name}, ${pokemon.types.join(', ')}`;
  navigator.clipboard.writeText(text).then(
    () => alert('Información copiada al portapapeles!'),
    (err) => console.error('Error al copiar:', err)
  );
};
