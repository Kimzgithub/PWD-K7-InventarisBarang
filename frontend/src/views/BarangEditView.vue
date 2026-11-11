<script setup>
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import barangService from '../services/barangService.js'
import BarangForm from '../components/BarangForm.vue'

const route = useRoute()
const router = useRouter()
const form = ref({
  kode_barang: '', nama_barang: '', kategori: '',
  harga: 0, stok: 0, satuan: 'pcs'
})
const loading = ref(false)

onMounted(async () => {
  try {
    const res = await barangService.getById(route.params.id)
    form.value = res.data.data
  } catch (e) {
    alert('Gagal memuat data: ' + (e.response?.data?.message || e.message))
    router.push({ name: 'barang-list' })
  }
})

const submit = async () => {
  loading.value = true
  try {
    await barangService.update(route.params.id, form.value)
    router.push({ name: 'barang-list' })
  } catch (e) {
    alert('Gagal update: ' + (e.response?.data?.message || e.message))
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="max-w-3xl mx-auto p-6">
    <div class="mb-6">
      <RouterLink to="/" class="text-emerald-600 hover:underline text-sm">&larr; Kembali</RouterLink>
      <h1 class="text-2xl font-bold text-gray-800 mt-2">✏️ Edit Barang</h1>
    </div>
    <BarangForm v-model="form" :is-edit="true" :loading="loading" @submit="submit" />
  </div>
</template>
