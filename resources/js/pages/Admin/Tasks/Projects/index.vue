<template>
  <div v-if="path" class="container">
    <card title="Our Projects">
      <div class="row">
        <project-card
          v-for="project in projects"
          :key="project.id"
          :project="project"
        />
      </div>
    </card>
  </div>
  <div v-else class="row justify-content-center">
    <div class="col-md-3 m-3">
      <card title="Our Projects" class="settings-card">
        <ul class="nav flex-column nav-pills">
          <li v-for="project in projects" :key="project.id" class="nav-item">
            <router-link
              :to="{
                name: 'tasks.project.id',
                params: { id: project.id }
              }"
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
  </div>
</template>

<script>
import ProjectCard from '../../../../components/Project/ProjectCard.vue'
import { mapGetters } from 'vuex'
export default {
  components: {
    ProjectCard
  },
  middleware: 'admin',
  data () {
    return {
      path: Boolean
    }
  },
  computed: mapGetters({
    projects: 'projects/all'
  }),
  watch: {
    $route () {
      if (this.$route.params) {
        this.path = false
      }
    }
  },
  created () {
    this.getProjects()
    this.path = this.$route.params
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
