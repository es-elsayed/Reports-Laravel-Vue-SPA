<template>
  <div class="board-wrapper">
    <div @click="toggleAddBoard = false" />
    <!-- <project-board /> -->
    <div class="board w-100">
      <!-- Board Composer -->
      <!-- -->
      <div class="add-card add-another-list" style="">
        <h4 class="c4 text-center" @click="toggleAdd">Add another list</h4>
        <add-task :projects="projects" v-if="!toggleAddBoard" />
        <!-- <form  @submit.prevent="addNewList">
          <input
            type="text"
            class="theme-input-style"
            placeholder="List Title"
          />
        </form> -->
      </div>
    </div>
    <!-- End Board Composer -->
  </div>
  <!-- <add-task @toggle-add-list="toggleAddBoard = true" /> -->
</template>
<script>
import { mapGetters } from 'vuex'
import axios from 'axios'
import AddTask from '../../components/Task/AddTask.vue'
// import ProjectBoard from '../../components/Project/ProjectBoard.vue'
// import AddTask from '../../components/Task/AddTask.vue'
export default {
  components: {
    AddTask
    // ProjectBoard,
    // AddTask
  },
  data() {
    return {
      toggleAddBoard: false,
      projects: []
      // newTask: {
      //   title: this.$refs.task_name.value,
      //   report_id: this.$route.params.id,
      //   who_is_assign: 'static',
      //   project_name: this.$refs.project_name.value,
      //   role: 'static eng.',
      //   description: this.$refs.description.value,
      //   difficulties: this.$refs.difficulties.value
      // }
    }
  },
  computed: mapGetters({
    user: 'auth/user',
    token: 'auth/token'
  }),
  mounted() {
    this.getAllList()
    this.getAllProjects()
  },
  methods: {
    toggleAdd() {
      this.toggleAddBoard = !this.toggleAddBoard
    },
    // addNewList() {
    //   // return console.log(this.$route.params.id);
    //   axios
    //     .post(`/api/reports/${this.$route.params.id}/tasks`, this.newTask)
    //     .then(res => console.log(res.data))
    // },
    getAllList() {
      axios
        .get(`/api/reports/${this.$route.params.id}/tasks`)
        .then(res => console.log(res.data))
    },
    getAllProjects() {
      axios.get('/api/projects').then(res => (this.projects = res.data))
    }
  }
}
</script>
