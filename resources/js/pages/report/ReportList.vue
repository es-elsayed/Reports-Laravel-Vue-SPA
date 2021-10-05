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
            <h4 class="c4 text-center" @click="toggleAdd">
              Add another list
            </h4>
            <section>
              <div class="blur"  v-if="!toggleAddBoard" @click="toggleAdd" />
              <dialog open  v-if="!toggleAddBoard">
                  <add-task
                    :projects="projects"
                    :users="users"
                    @add-task="listenToEmit"
                    @close="toggleAdd"
                  />
              </dialog>
            </section>
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
  data () {
    return {
      toggleAddBoard: true,
      // toggleAddBoard: false,
      tasks: [],
      projects: [],
      users: []
    }
  },
  computed: mapGetters({
    user: 'auth/user',
    token: 'auth/token'
  }),
  mounted () {
    this.getAllList()
    this.getAllProjects()
    this.getAllUsers()
  },
  afterUpdated () {
    this.getAllList()
    console.log('hi')
  },
  methods: {
    hi () {
      console.log('hi')
    },
    toggleAdd () {
      this.toggleAddBoard = !this.toggleAddBoard
    },
    getAllList () {
      axios
        .get(`/api/reports/${this.$route.params.id}/tasks`)
        .then(res => (this.tasks = res.data))
    },
    getAllProjects () {
      axios.get('/api/projects').then(res => (this.projects = res.data))
    },
    getAllUsers () {
      axios.get('/api/users').then(res => (this.users = res.data))
    },
    listenToEmit () {
      this.getAllList()
      this.toggleAddBoard = true
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
  z-index: 10;
}

dialog {
  position: fixed;
  top: 1vh;
  left: 10%;
  width: 80%;
  z-index: 100;
  border-radius: 12px;
  border: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
  padding: 3rem;
  margin: 0;
  overflow: hidden;
}

/* header {
  background-color: #3a0061;
  color: white;
  width: 100%;
  padding: 1rem;
}

header h2 {
  margin: 0;
}

section {
  padding: 1rem;
}

menu {
  padding: 1rem;
  display: flex;
  justify-content: flex-end;
  margin: 0;
} */

@media (min-width: 768px) {
  dialog {
    left: calc(50% - 20rem);
    width: 40rem;
  }
}
</style>
