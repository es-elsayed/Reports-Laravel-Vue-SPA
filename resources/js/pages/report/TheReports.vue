<template>
  <div class="container">
    <card title="Daily Report">
      <add-task :projects="projects" :users="users" :reports="reports" />
    </card>
    <!-- <section> -->
    <!-- <div class="blur" @click="$router.back()" />
      <dialog open> -->
    <!-- </dialog>
    </section> -->
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
<style scoped>
div.blur {
  position: fixed;
  top: 0;
  left: 0;
  height: 100vh;
  width: 100%;
  background-color: rgba(0, 0, 0, 0.75);
  z-index: 9999;
}

dialog {
  position: fixed;
  top: 10vh;
  left: 10%;
  width: 80%;
  z-index: 99999;
  border-radius: 12px;
  border: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
  padding: 3rem;
  margin: 0;
  overflow: hidden;
}

@media (min-width: 768px) {
  dialog {
    left: calc(50% - 20rem);
    width: 40rem;
  }
}
</style>
