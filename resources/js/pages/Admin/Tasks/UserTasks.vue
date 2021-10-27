<template>
  <section>
    <div class="row">
      <div class="col-4">
        <select
          id="project_id"
          name="project_id"
          class="form-select form-select-lg mb-3 select-odd"
        >
          <!-- :class="{ 'is-invalid': form.errors.has('project_id') }" -->
          <option>Choose Project Name</option>

          <option
            v-for="project in projects"
            :key="project.id"
            :value="project.id"
          >
            {{ project.name }}
          </option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col-8 pt-4">
        <task-card
          v-for="(task, index) in tasks"
          :key="index"
          :task="task"
          :index="index"
        />
      </div>
      <div class="col-4">
        <user-card v-if="user" :user="user" />
      </div>
    </div>
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
  </section>
</template>
<script>
import { mapGetters } from 'vuex'
import TaskCard from '../../../components/Task/TaskCard.vue'
import UserCard from '../../../components/User/UserCard.vue'
export default {
  components: {
    UserCard,
    TaskCard
  },
  data() {
    return {
      path: Boolean
    }
  },
  computed: mapGetters({
    user: 'users/show',
    tasks: 'tasks/show',
    projects: 'projects/shared',
    last_page: 'tasks/lastPage',
    current_page: 'tasks/currentPage'
  }),
  watch: {
    $route() {
      if (this.$route.params) {
        this.path = false
      }
    }
  },
  mounted() {
    this.getTasks()
    this.getUser()
    this.sharedProjects()
    // console.log(this.projects)
  },
  methods: {
    async getTasks() {
      await this.$store.dispatch('tasks/fetchUserTasks', {
        id: this.$route.params.id
      })
      // console.log(this.tasks)
    },
    async getUser() {
      await this.$store.dispatch('users/fetchUser', {
        id: this.$route.params.id
      })
      // console.log(this.user)
    },
    async sharedProjects() {
      await this.$store.dispatch('projects/fetchSharedProject', {
        id: this.$route.params.id
      })
    },
    async prevPage() {
      await this.$store.dispatch('tasks/fetchPrevPage', {
        id: this.$route.params.id
      })
    },
    async nextPage() {
      await this.$store.dispatch('tasks/fetchNextPage', {
        id: this.$route.params.id
      })
    }
  }
}
</script>
<style scoped>
select {
  background-color: var(--sub-color);
  border-radius: 25px;
  border: 1px solid var(--main-color);
  color: var(--main-color);
}
</style>
