<template>
  <card>
    <task-card v-for="(task, index) in tasks" :key="index" :task="task" :index="index" />
    <div class="row">
      <div class="col my-3">
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
            <li
              class="page-item"
              :class="{ disabled: current_page >= last_page }"
            >
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
    </div>
  </card>
</template>
<script>
import { mapGetters } from 'vuex'
import axios from 'axios'
import TaskCard from '../../components/Task/TaskCard.vue'

export default {
  components: {
    TaskCard
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
  mounted () {
    // console.log(this.role)
    this.getAllList()
    console.log(this.tasks)
  },
  methods: {
    getAllList () {
      axios.get('/api/reports/tasks').then(res => {
        this.tasks = res.data.data
        this.current_page = res.data.meta.current_page
        this.last_page = res.data.meta.last_page
        console.log(this.tasks)
      })
    },
    async list (page) {
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
