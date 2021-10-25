<template>
  <div v-if="path" class="container">
    <card title="Daily Report">
      <div class="row">
        <user-card v-for="user in users" :key="user.id" :user="user" />
      </div>
    </card>
  </div>
  <div v-else class="row justify-content-center">
    <div class="col-md-3 m-3">
      <card title="User Tasks" class="settings-card">
        <ul class="nav flex-column nav-pills">
          <li v-for="user in users" :key="user.id" class="nav-item">
            <router-link
              :to="{
                name: 'tasks.user.id',
                params: { id: user.id }
              }"
              class="nav-link"
              active-class="active"
            >
              <fa icon="user" fixed-width />
              {{ user.name }}
            </router-link>
          </li>
        </ul>
      </card>
    </div>

    <div class="col-md">
      <transition name="fade" mode="out-in">
        <router-view />
      </transition>
    </div>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import TaskCard from '../../../components/Task/TaskCard.vue'
// import axios from 'axios'
export default {
  components: {
    TaskCard
  },
  middleware: 'admin',
  // data () {
  //   return {
  //     current_page: this.c_page,
  //     last_page: this.l_page
  //   }
  // },
  computed: mapGetters({
    tasks: 'tasks/show',
    current_page: 'tasks/current_page',
    last_page: 'tasks/last_page'
  }),
  watch: {
    $route() {
      this.getTasks()
    }
  },
  created() {
    this.getTasks()
  },
  methods: {
    async getTasks() {
      await this.$store.dispatch('tasks/fetchUserTasks', {
        id: this.$route.params.id
      })
    },
    async nextPage() {
      await this.$store.dispatch('tasks/fetchNext', {
        id: this.$route.params.id,
        type: 'user'
      })
    },
    async prevPage() {
      await this.$store.dispatch('tasks/fetchPrev', {
        id: this.$route.params.id,
        type: 'user'
      })
    }
  }
}
</script>
