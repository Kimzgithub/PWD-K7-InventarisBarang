import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', name: 'barang-list', component: () => import('../views/BarangListView.vue') },
    { path: '/barang/create', name: 'barang-create', component: () => import('../views/BarangCreateView.vue') },
    { path: '/barang/edit/:id', name: 'barang-edit', component: () => import('../views/BarangEditView.vue') }
  ]
})

export default router
