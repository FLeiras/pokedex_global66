import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import type { UserConfig } from 'vite';

export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@': '/src',
    },
  },
} as UserConfig);

