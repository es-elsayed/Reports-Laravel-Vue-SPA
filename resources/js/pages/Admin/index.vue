<template>
  <!-- <div class="row justify-content-center">
    <div class="col-md-3 m-3">
      <card title="Our Projects" class="settings-card">
        <ul class="nav flex-column nav-pills">
          <li v-for="project in projects" :key="project.id" class="nav-item">
            <router-link
              :to="{ name: 'reports.tasks.project', params: { id: project.id } }"
              class="nav-link"
              active-class="active"
            >
              <fa icon="user" fixed-width />
              {{ project.name }}
            </router-link>
          </li>
        </ul>
      </card>
    </div>

    <div class="col-md">
      <transition name="fade" mode="out-in">
        <router-view />
      </transition>
    </div>
  </div> -->
  <div class="row">
    <div class="col-lg-7 mx-auto mt-5 pt-5">
      <card title="Choose a View" class="bg-transparent">
        <div class="row">
          <router-link
            :to="{ name: 'tasks.project' }"
            class="col text-center py-3 text-decoration-none bg-main text-sub scale-down"
          >
            Project
          </router-link>
          <router-link
            :to="{ name: 'tasks.user' }"
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
  middleware: "admin"
};
</script>
<style scoped>

</style>
