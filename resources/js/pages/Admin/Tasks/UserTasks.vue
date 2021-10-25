<template>
  <div class="row">
    <div class="col-8">
      <task-card
        v-for="(task, index) in tasks"
        :key="index"
        :task="task"
        :index="index"
      />
    </div>
    <div class="col-4"><user-card :user="user"></user-card></div>
  </div>
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
    tasks: 'tasks/show'
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
    console.log(this.$route.params.id)
  },
  methods: {
    async getTasks() {
      await this.$store.dispatch('tasks/fetchUserTasks', {
        id: this.$route.params.id
      })
      console.log(this.tasks)
    },
    async getUser() {
      await this.$store.dispatch('users/fetchUser', {
        id: this.$route.params.id
      })
      console.log(this.user)
    }
  }
}
</script>
