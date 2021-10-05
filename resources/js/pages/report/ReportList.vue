<template>
  <div class="container-fluid">
    <div class="row">
      <table class="dh-table">
        <thead class="text_color-bg text-white">
          <tr>
            <th>Task Title</th>
            <th>Project Name</th>
            <th>Date</th>
            <th>Role</th>
            <th>Who is Assign</th>
            <th>Description</th>
            <th>Time</th>
            <th>Difficulties</th>
          </tr>
        </thead>
        <tbody>
          <task-card v-for="task in tasks" :key="task.id" :task="task" />
        </tbody>
      </table>
      <div class="board-wrapper">
        <div class="board w-100">
          <div class="add-card add-another-list" style="">
            <h4 class="c4 text-center" @click="toggleAdd">Add another list</h4>
            <add-task
              v-if="!toggleAddBoard"
              :projects="projects"
              :users="users"
              @add-task="listenToEmit"
            />
            <!-- <base-dialog @close="hi" v-if="!toggleAddBoard" /> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import axios from 'axios'
import AddTask from '../../components/Task/AddTask.vue'
import TaskCard from '../../components/Task/TaskCard.vue'
// import BaseDialog from '../../components/UI/BaseDialog.vue'
export default {
  components: {
    AddTask,
    TaskCard
    // BaseDialog
  },
  data() {
    return {
      toggleAddBoard: true,
      tasks: [],
      projects: [],
      users: []
    }
  },
  computed: mapGetters({
    user: 'auth/user',
    token: 'auth/token'
  }),
  mounted() {
    this.getAllList()
    this.getAllProjects()
    this.getAllUsers()
  },
  afterUpdated() {
    this.getAllList()
    console.log('hi')
  },
  methods: {
    hi() {
      console.log('hi')
    },
    toggleAdd() {
      this.toggleAddBoard = !this.toggleAddBoard
    },
    getAllList() {
      axios
        .get(`/api/reports/${this.$route.params.id}/tasks`)
        .then(res => (this.tasks = res.data))
    },
    getAllProjects() {
      axios.get('/api/projects').then(res => (this.projects = res.data))
    },
    getAllUsers() {
      axios.get('/api/users').then(res => (this.users = res.data))
    },
    listenToEmit() {
      this.getAllList()
      this.toggleAddBoard = true
    }
  }
}
</script>
