# Pokédex Global66

Aplicación móvil desarrollada con **Flutter** que consume la **PokéAPI** para mostrar información detallada de cada Pokémon, gestionar favoritos y explorar datos relevantes de la Pokédex.

---

## Características

- **Listado de Pokémon** obtenido desde la API

- **Detalle del Pokémon** con:
  - Imagen oficial
  - Tipos
  - Descripción
  - Altura y peso
  - Categoría
  - Habilidad
  - Debilidades
  - Porcentaje de género
- ❤️ **Sistema de favoritos**
  - Marcar / desmarcar Pokémon
  - Eliminar favoritos con **gesto swipe**
- **UI basada en diseño Figma**
- **Diseño responsive**
- **Navegación con Bottom Navigation**
- **Tests unitarios y de widgets**

---

## Arquitectura

El proyecto sigue una estructura inspirada en **Clean Architecture** para mantener separación de responsabilidades.

### Capas

**Data**

- Obtención de datos desde la API
- Implementación de repositorios

**Domain**

- Entidades
- Contratos de repositorios

**Presentation**

- Widgets
- Páginas
- Providers (gestión de estado)

---

## Tecnologías utilizadas

- **Flutter**
- **Dart**
- **Riverpod** – gestión de estado
- **Dio** – cliente HTTP
- **Freezed** – generación de modelos
- **flutter_svg** – renderizado de SVG
- **PokéAPI** – fuente de datos

API utilizada:

https://pokeapi.co/

---

## Instalación

Clonar el repositorio:

```bash
git clone https://github.com/TU-USUARIO/pokedex_global.git
```

Entrar en el proyecto

```bash
cd pokedex_global
```

Instalar dependencias

```bash
flutter pub get
```

Ejecutar la aplicación:

```bash
flutter run
```

## Tests

El proyecto incluye tests unitarios y de widgets.

Ejecutalos con:

```bash
flutter test
```

Para ver una salida más detallada:

```bash
flutter test -r expanded
```

## Flujo de la aplicación

La aplicación incluye un flujo inicial compuesto por:

1. Splash Screen

2. Onboarding

3. Pokédex principal

## Funcionalidades principales

### Listado de Pokémon

- Carga inicial desde PokéAPI

- Visualización en cards personalizadas

### ❤️ Detalle de Pokémon

Incluye:

- Imagen oficial

- Tipos

- Descripción

- Categoría

- Habilidad

- Debilidades

- Barra de género

### ❤️ Favoritos

- Agregar o quitar favoritos

- Eliminar con gesto swipe

### Nota

La solucion esta desarrollada para que en el primer inicio falle la carga del listado y asi poder mostrar el caso de uso y la vista de Error. Al dar click en el boton "Reintentar" todo funciona con normalidad.

### Autor

**_Federico Leiras_**

### Licencia

Proyecto desarrollado con fines educativos como parte de un **_challenge técnico utilizando Flutter_**.
