<script setup>
import { computed } from 'vue'

const props = defineProps({
  modelValue: { type: Object, required: true },
  isEdit: { type: Boolean, default: false },
  loading: { type: Boolean, default: false }
})
const emit = defineEmits(['submit', 'update:modelValue'])

const form = computed({
  get: () => props.modelValue,
  set: (val) => emit('update:modelValue', val)
})
</script>

<template>
  <form @submit.prevent="emit('submit')"
        class="bg-white shadow-md rounded-xl p-6 space-y-4">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-1">Kode Barang</label>
        <input v-model="form.kode_barang" type="text" required
               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 outline-none" />
      </div>
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-1">Nama Barang</label>
        <input v-model="form.nama_barang" type="text" required
               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 outline-none" />
      </div>
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-1">Kategori</label>
        <input v-model="form.kategori" type="text"
               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 outline-none" />
      </div>
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-1">Harga (Rp)</label>
        <input v-model.number="form.harga" type="number" required
               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 outline-none" />
      </div>
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-1">Stok</label>
        <input v-model.number="form.stok" type="number" required
               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 outline-none" />
      </div>
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-1">Satuan</label>
        <input v-model="form.satuan" type="text"
               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 outline-none" />
      </div>
    </div>

    <button type="submit" :disabled="loading"
            class="w-full bg-emerald-600 hover:bg-emerald-700 disabled:bg-gray-400 text-white font-semibold py-2.5 px-4 rounded-lg transition">
      {{ loading ? 'Menyimpan...' : (isEdit ? 'Update Barang' : 'Simpan Barang') }}
    </button>
  </form>
</template>
