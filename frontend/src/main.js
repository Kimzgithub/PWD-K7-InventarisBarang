import './assets/main.css'   // ← Tailwind CSS

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

createApp(App).use(router).mount('#app')
