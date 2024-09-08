import { createRouter, createWebHistory } from 'vue-router';

import FavoritesView from '../views/FavoritesView.vue';
import HomeView from '../views/HomeView.vue';
import NotFound from '../views/EmptyListView.vue';
import WelcomeView from '../views/WelcomeView.vue';

const routes = [
  {
    path: '/',
    name: 'welcome',
    component: WelcomeView,
  },
  {
    path: '/home',
    name: 'home',
    component: HomeView,
  },
  {
    path: '/favorites',
    name: 'favorites',
    component: FavoritesView,
  },
  {
    path: "/:pathMatch(.*)*",
    name: "NotFound",
    component: NotFound,
    meta: { title: "Ruta no encontrada" },
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
