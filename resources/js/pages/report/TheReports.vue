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
        v-for="report in reports"
        :key="report.id"
        :report='report'
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
      reports: []
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
      axios.get(`/api/reports/${this.user.id}`).then(res => {
        this.reports = res.data
        console.log(res.data)
      })
    }
  }
}
</script>
