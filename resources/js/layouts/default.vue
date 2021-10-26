<template>
  <!-- start custom -->
  <div class="wrapper">
    <navbar />

    <div class="main-wrapper">
      <div class="container-fluid container-xl my-4 mx-auto">
        <child />
      </div>
    </div>
  </div>
</template>

<script>
import Navbar from '~/components/Navbar'
export default {
  name: 'MainLayout',
  components: {
    Navbar
  }
}
</script>
