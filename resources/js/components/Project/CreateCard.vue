<template>
  <div class="col-xl-3 col-lg-4 col-sm-6">
    <!-- Project Box -->
    <div
      class="project-box d-flex align-items-center justify-content-center mb-30"
    >
      <router-link
        :to="{ name: 'project.create' }"
        class="bold font-14 black d-flex align-items-center"
      >
        <img src="../../assets/img/svg/plus.svg" alt="" class="svg mr-2" />
        Create New Project
      </router-link>
    </div>
    <!-- End Project Box -->
  </div>
</template>
