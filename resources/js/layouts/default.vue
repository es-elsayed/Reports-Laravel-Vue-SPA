<template>
  <!-- start custom -->
  <div class="wrapper">
    <navbar />

    <div class="main-wrapper">
      <sidebar v-if="user" />
      <!-- <admin-sidebar v-if="user.role=='admin'" /> -->

      <div class="main-content mt-4">
        <child />
      </div>
    </div>
  </div>
  <!-- start default  -->
  <!-- <div class="main-layout">
    <navbar />
    <sidebar />
    <div class="container-lg mt-4">
      <child />
    </div>
  </div> -->
</template>

<script>
import { mapGetters } from 'vuex'
import Navbar from '~/components/Navbar'
import Sidebar from '~/components/Sidebar'
import AdminSidebar from '~/components/AdminSidebar'
// import ProjectCard from "~/components/Project/ProjectCard";
export default {
  name: 'MainLayout',
  components: {
    Navbar,
    Sidebar,
    AdminSidebar
    // ProjectCard,
  },
  computed: mapGetters({
    user: 'auth/user'
  })
}
</script>
