<template>
  <div class="container-fluid">
    <div class="row">
      <table v-if="tasks.length > 0" class="dh-table">
        <thead class="text_color-bg text-white">
          <tr>
            <th>Task Title</th>
            <th>Project Name</th>
            <th>Date</th>
            <th>User Name</th>
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
    </div>
    <nav aria-label="...">
      <ul class="pagination">
        <li class="page-item" :class="{ disabled: current_page <= 1 }">
          <button
            type="button"
            :disabled="current_page <= 1"
            class="page-link"
            @click="list(--current_page)"
          >
            Previous
          </button>
        </li>
        <!-- <li class="page-item">
          <button type="button"  class="page-link">
            1
          </button>
        </li>
        <li class="page-item active" aria-current="page">
          <button type="button" class="page-link">
            2
          </button>
        </li>
        <li class="page-item">
          <button type="button" class="page-link">
            3
          </button>
        </li> -->
        <li class="page-item" :class="{ disabled: current_page >= last_page }">
          <button
            type="button"
            :disabled="current_page >= last_page"
            class="page-link"
            @click="list(++current_page)"
          >
            Next
          </button>
        </li>
      </ul>
    </nav>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import axios from 'axios'
import TaskCard from '../../components/Task/TaskCard.vue'
// import pagination from 'laravel-vue-pagination'
// import Button from '../../components/Button.vue'

export default {
  components: {
    TaskCard
    // pagination
  },
  middleware: 'admin',
  data () {
    return {
      current_page: 1,
      last_page: 1,
      tasks: []
    }
  },
  computed: mapGetters({
    user: 'auth/user',
    role: 'auth/role'
  }),
  mounted() {
    // console.log(this.role)
    this.getAllList()
    console.log(this.tasks)
  },
  methods: {
    getAllList() {
      axios.get('/api/reports/tasks').then(res => {
        this.tasks = res.data.data
        this.current_page = res.data.meta.current_page
        this.last_page = res.data.meta.last_page
      })
    },
    async list(page) {
      await axios
        .get(`/api/reports/tasks?page=${page}`)
        .then(res => {
          this.tasks = res.data.data
          // this.current_page = res.data.meta.current_page
          // this.last_page = res.data.meta.last_page
          console.log(res.data.meta)
        })
        .catch(({ response }) => {
          console.error(response)
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
.pagination {
  margin-bottom: 0;
}

@media (min-width: 768px) {
  dialog {
    left: calc(50% - 20rem);
    width: 40rem;
  }
}
</style>
