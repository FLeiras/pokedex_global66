# Pokédex

Aplicación diseñada para consumir la API de Pokémon (`pokeAPI`). La aplicación permite explorar una lista de Pokémon, ver detalles de cada uno y ofrece una barra de busqueda para facilitar su uso.

## 🌟 Características

- **Pantalla de Inicio**: Muestra una lista de 10 Pokémons. Los Pokémons se presentan en tarjetas con su nombre y la opción de añadirlo a favoritos.
- **Detalles del Pokémon**: Al hacer clic en una tarjeta de Pokémon, se produce la apertura de un modal que muestra detalles del mismo como nombre, peso, altura y tipos.
- **Búsqueda**: Facilita la búsqueda de Pokémon por nombre.

## 🛠️ Tecnologías

- **Frontend**: Vue.js 3, TypeScript, Vue Router, Pinia.
- **Build Tool**: Vite.
- **API**: `pokeAPI`
- **Estilización**: CSS

## 🚀 Acceso al Proyecto

Para ejecutar este proyecto en tu máquina local, sigue estos pasos:

1. **Clona el repositorio**:

   ```bash
   git clone https://github.com/FLeiras/pokedex_global66.git
   ```

2. **Navegar al directorio del proyecto**
   ```sh
   cd pokedex_global66
   ```

3. **Instalar dependencias**
   ```sh
   npm install
   ```

4. **Ejecutar la aplicaión**
   ```sh
   npm run dev
   ```

Listo!! Ya podés navegar por el mundo Pokémon 👏

Me gustaría agregar, en principio, muchas gracias por la oportunidad, dicho esto les comento el porqué de mi elección dentro del código que verán. A pesar de ser una solución simple, opte por el uso de composables function de Vue3 para que mis componentes no tengan una dependencia sobre el store de mi app, esto es, si el día de mañana deciden cambiar Pinia por 'Manzana' 😂, o simplemente, el equipo, realizar un downgrade a VueX, esto solo afectaría a esos composables, ya que son los únicos que tienen comunicación y contacto con mi store, así los componentes no sentirían el cambio y por ende el costo técnico será menor. De vuelta, gracias por la oportunidad y espero que les guste mi trabajo.