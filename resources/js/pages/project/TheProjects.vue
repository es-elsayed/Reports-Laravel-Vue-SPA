<template>
  <!-- <card :title="'name of allah'">
   </card> -->
  <div class="container-fluid">
    <div class="row">
      <project-header
        :userId="user.id"
        @createdProjectSuccessfully="getAllProjects"
      />
    </div>
    <div class="row">
      <project-card
        v-for="project in projects"
        :key="project.id"
        :projectTitle="project.title"
        :lastUpdate="project.updated_at"
        :projectId="project.id"
      />
      <!-- <div v-for="project in projects">{{ project.title }}</div> -->
      <!-- <create-project></create-project> -->
    </div>
  </div>
</template>
<script>
import axios from 'axios'
import { mapGetters } from 'vuex'

import ProjectCard from '../../components/Project/ProjectCard.vue'
import ProjectHeader from '../../components/Project/ProjectHeader.vue'
export default {
  components: { ProjectCard, ProjectHeader },
  data () {
    return {
      projects: []
    }
  },
  computed: mapGetters({
    user: 'auth/user',
    token: 'auth/token'
  }),
  mounted () {
    this.getAllProjects()
  },
  methods: {
    getAllProjects () {
      axios.get(`/api/projects/${this.user.id}`).then(res => {
        this.projects = res.data
        console.log(res.data)
      })
    }
  }
}
</script>
