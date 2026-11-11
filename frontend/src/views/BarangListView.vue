<script setup>
import { ref, onMounted } from 'vue'
import barangService from '../services/barangService.js'

const barang = ref([])
const loading = ref(true)
const error = ref('')

const fetchData = async () => {
  loading.value = true
  error.value = ''
  try {
    const res = await barangService.getAll()
    barang.value = res.data.data
  } catch (e) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

const hapus = async (id) => {
  if (!confirm('Yakin hapus barang ini?')) return
  try {
    await barangService.remove(id)
    fetchData()
  } catch (e) {
    alert('Gagal hapus: ' + e.message)
  }
}

onMounted(fetchData)
</script>

<template>
  <div class="max-w-6xl mx-auto p-6">
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-bold text-gray-800">📦 Daftar Barang</h1>
      <RouterLink to="/barang/create"
                  class="bg-emerald-600 hover:bg-emerald-700 text-white font-semibold px-4 py-2 rounded-lg transition">
        + Tambah Barang
      </RouterLink>
    </div>

    <div v-if="loading" class="text-center py-12 text-gray-500">Memuat data...</div>
    <div v-else-if="error" class="bg-red-50 text-red-700 p-4 rounded-lg">{{ error }}</div>
    <div v-else-if="barang.length === 0" class="text-center py-12 text-gray-500">
      Belum ada data barang.
    </div>

    <div v-else class="bg-white shadow-md rounded-xl overflow-hidden overflow-x-auto">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase">Kode</th>
            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase">Nama</th>
            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase">Kategori</th>
            <th class="px-4 py-3 text-right text-xs font-semibold text-gray-600 uppercase">Harga</th>
            <th class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase">Stok</th>
            <th class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase">Aksi</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-100">
          <tr v-for="b in barang" :key="b.id" class="hover:bg-gray-50">
            <td class="px-4 py-3 text-sm font-mono text-gray-700">{{ b.kode_barang }}</td>
            <td class="px-4 py-3 text-sm font-medium text-gray-800">{{ b.nama_barang }}</td>
            <td class="px-4 py-3 text-sm">
              <span class="inline-block bg-emerald-100 text-emerald-700 text-xs px-2 py-1 rounded-full">
                {{ b.kategori }}
              </span>
            </td>
            <td class="px-4 py-3 text-sm text-right text-gray-700">
              Rp {{ Number(b.harga).toLocaleString('id-ID') }}
            </td>
            <td class="px-4 py-3 text-sm text-center">
              <span :class="b.stok > 10 ? 'text-green-600' : 'text-orange-600'" class="font-semibold">
                {{ b.stok }}
              </span>
            </td>
            <td class="px-4 py-3 text-sm text-center space-x-2">
              <RouterLink :to="`/barang/edit/${b.id}`"
                          class="inline-block bg-blue-500 hover:bg-blue-600 text-white text-xs px-3 py-1 rounded-md">
                Edit
              </RouterLink>
              <button @click="hapus(b.id)"
                      class="bg-red-500 hover:bg-red-600 text-white text-xs px-3 py-1 rounded-md">
                Hapus
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
