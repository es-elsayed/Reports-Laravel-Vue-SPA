<template>
  <nav class="sidebar" data-trigger="scrollbar">
    <!-- Sidebar Header -->
    <div class="sidebar-header d-none d-lg-block">
      <!-- Sidebar Toggle Pin Button -->
      <div class="sidebar-toogle-pin">
        <i class="icofont-tack-pin"></i>
      </div>
      <!-- End Sidebar Toggle Pin Button -->
    </div>
    <!-- End Sidebar Header -->

    <!-- Sidebar Body -->
    <div class="sidebar-body">
      <!-- Nav -->
      <ul class="nav">
        <li>
          <router-link link mode="flat" to="/project">
            <i class="icofont-calendar"></i>
            <span class="link-title">project manager</span>
          </router-link>
        </li>
      </ul>
      <!-- End Nav -->
    </div>
    <!-- End Sidebar Body -->
  </nav>
</template>
<script>
// import BaseButton from "../UI/BaseButton.vue";
export default {
  // components: { BaseButton },
};
</script>

<style>
</style>
