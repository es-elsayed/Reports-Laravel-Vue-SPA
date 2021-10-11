<template>
  <nav class="sidebar" data-trigger="scrollbar">
    <!-- Sidebar Header -->
    <div class="sidebar-header d-none d-lg-block">
      <!-- Sidebar Toggle Pin Button -->
      <div class="sidebar-toogle-pin">
        <i class="icofont-tack-pin" />
      </div>
      <!-- End Sidebar Toggle Pin Button -->
    </div>
    <!-- End Sidebar Header -->

    <!-- Sidebar Body -->
    <div class="sidebar-body">
      <!-- Nav -->
      <ul class="nav">
        <li>
          <router-link link mode="flat" :to="{ name: role =='admin'? 'reports.list' : 'reports' }">
            <i class="icofont-calendar" />
            <span class="link-title">Reports</span>
          </router-link>
        </li>
      </ul>
      <!-- End Nav -->
    </div>
    <!-- End Sidebar Body -->
  </nav>
</template>
<script>
import { mapGetters } from 'vuex'
export default {
  computed: mapGetters({
    role: 'auth/role'
  })
}
</script>

<style></style>
