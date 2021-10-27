<template>
  <div class="bg-third report-add text-main py-2 px-2">
    <add-task :projects="projects" :users="users" :reports="reports" />
  </div>
</template>
<script>
import axios from 'axios'
import { mapGetters } from 'vuex'

import AddTask from '../../components/Task/AddTask.vue'
export default {
  components: {
    AddTask
  },
  middleware: 'auth',

  data () {
    return {
      projects: [],
      users: [],
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
      axios.get('/api/reports').then(res => {
        console.log(res.data)
        this.projects = res.data.projects
        this.users = res.data.users
        this.reports = res.data.reports
      })
    }
  }
}
</script>
<style scoped></style>
