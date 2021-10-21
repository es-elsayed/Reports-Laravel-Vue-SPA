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
          <router-link link mode="flat" :to="{ name: role =='admin'? 'reports.tasks' : 'reports.add' }">
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
<style scoped>
.sidebar {
  top: 56px;
  height: calc(100% - 56px);
  overflow: scroll;
}
.sidebar-body li a {
  color: #262626 !important;
}
.sidebar-body li:hover {
  background: linear-gradient(45deg, #f6d51b, rgb(219, 218, 218));
}
.sidebar-body li ul li:hover {
  background: #f6d51b;
  color: red !important;
}
</style>
