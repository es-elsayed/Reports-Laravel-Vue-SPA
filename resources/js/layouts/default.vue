<template>
  <!-- start custom -->
  <div class="wrapper">
    <navbar />

    <div class="main-wrapper">
      <sidebar v-if="user" />

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
// import ProjectCard from "~/components/Project/ProjectCard";
export default {
  computed: mapGetters({
    user: 'auth/user'
  }),
  name: 'MainLayout',

  components: {
    Navbar,
    Sidebar
    // ProjectCard,
  }
}
</script>
