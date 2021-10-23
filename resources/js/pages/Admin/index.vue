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
      <card title="Choose a View">
        <div class="row">
          <router-link
            :to="{ name: 'reports.tasks' }"
            class="col text-center py-3 text-warning text-decoration-none bg-dark"
          >
            Project
          </router-link>
          <router-link
            :to="{ name: 'user.tasks' }"
            class="col text-center py-3 text-dark text-decoration-none bg-warning"
          >
            Users
          </router-link>
        </div>
      </card>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  middleware: 'admin',

  computed: mapGetters({
    projects: 'projects/all'
  }),
  created () {
    this.getProjects()
    // this.svg = require(`resources/assets/images/svg/${this.name}.svg`);
  },
  methods: {
    async getProjects () {
      await this.$store.dispatch('projects/fetchProjects')
      console.log(this.projects)
    }
  }
}
</script>

<style>
.settings-card .card-body {
  padding: 0;
}
svg:not(:root).svg-inline--fa {
  color: #fdc106;
}
.nav-pills .nav-link {
  color: #262626;
  background-color: #f7f9fb;
  font-weight: bold;
}
.nav-pills .nav-link.active {
  background-color: #fac4228c;
  color: #262626;
}
</style>
