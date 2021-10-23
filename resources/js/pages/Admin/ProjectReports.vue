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
import TaskCard from '../../components/Task/TaskCard.vue'

export default {
  components: {
    TaskCard
  },
  middleware: 'admin',
  data () {
    return {
      current_page: 1,
      last_page: 1
    }
  },
  computed: mapGetters({
    tasks: 'tasks/show'
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
    }
  }
}
</script>
