<template>
  <index-sidebar v-if="role !== '' ">
    <li>
      <router-link link mode="flat" :to="{ name: 'reports.add' }">
        <i class="icofont-calendar" />
        <span class="link-title">Reports</span>
      </router-link>
    </li>
  </index-sidebar>
</template>
<script>
import { mapGetters } from 'vuex'
import IndexSidebar from './index.vue'
export default {
  name: 'UserSidebar',
  components: {
    IndexSidebar
  },
  computed: mapGetters({
    role: 'auth/role'
  })
}
</script>
