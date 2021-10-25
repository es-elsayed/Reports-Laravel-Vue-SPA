<template>
  <div class="row">
    <div class="col-lg-7 mx-auto mt-5 pt-5">
      <card title="Choose a View" class="bg-transparent">
        <div class="row">
          <router-link
            :to="{ name: 'tasks.projects' }"
            class="col text-center py-3 text-decoration-none bg-main text-sub scale-down"
          >
            Project
          </router-link>
          <router-link
            :to="{ name: 'tasks.users' }"
            class="col text-center py-3 text-decoration-none text-main bg-sub scale-down"
          >
            Users
          </router-link>
        </div>
      </card>
    </div>
  </div>
</template>

<script>
export default {
  middleware: 'admin'
}
</script>
<style scoped></style>
