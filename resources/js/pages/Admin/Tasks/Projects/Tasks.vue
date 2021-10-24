<template>
  <card>
    <task-card
      v-for="(task, index) in tasks"
      :key="index"
      :task="task"
      :index="index"
    />
    <div class="row">
      <div class="col my-3">
        <nav aria-label="...">
          <ul class="pagination">
            <li class="page-item" :class="{ disabled: current_page <= 1 }">
              <button
                type="button"
                :disabled="current_page <= 1"
                class="page-link"
                @click="prevPage()"
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
                @click="nextPage()"
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
import TaskCard from '../../../../components/Task/TaskCard.vue'

export default {
  components: {
    TaskCard
  },
  middleware: 'admin',
  computed: mapGetters({
    tasks: 'tasks/show',
    current_page: 'tasks/current_page',
    last_page: 'tasks/last_page'
  }),
  watch: {
    $route () {
      this.getTasks()
    }
  },
  created () {
    this.getTasks()
  },
  methods: {
    async getTasks () {
      await this.$store.dispatch('tasks/fetchTask', {
        id: this.$route.params.id
      })
    },
    async nextPage () {
      await this.$store.dispatch('tasks/fetchNext', {
        id: this.$route.params.id,
        type: 'project'
      })
    },
    async prevPage () {
      await this.$store.dispatch('tasks/fetchPrev', {
        id: this.$route.params.id,
        type: 'project'
      })
    }
  }
}
</script>
