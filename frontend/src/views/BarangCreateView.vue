<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import barangService from '../services/barangService.js'
import BarangForm from '../components/BarangForm.vue'

const router = useRouter()
const form = ref({
  kode_barang: '', nama_barang: '', kategori: '',
  harga: 0, stok: 0, satuan: 'pcs'
})
const loading = ref(false)

const submit = async () => {
  loading.value = true
  try {
    await barangService.create(form.value)
    router.push({ name: 'barang-list' })
  } catch (e) {
    alert('Gagal: ' + (e.response?.data?.message || e.message))
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="max-w-3xl mx-auto p-6">
    <div class="mb-6">
      <RouterLink to="/" class="text-emerald-600 hover:underline text-sm">&larr; Kembali</RouterLink>
      <h1 class="text-2xl font-bold text-gray-800 mt-2">➕ Tambah Barang Baru</h1>
    </div>
    <BarangForm v-model="form" :loading="loading" @submit="submit" />
  </div>
</template>
