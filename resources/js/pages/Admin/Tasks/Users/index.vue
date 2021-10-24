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
      <card title="Our Users" class="settings-card">
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
import UserCard from '../../../../components/User/UserCard.vue'
export default {
  components: {
    UserCard
  },
  data () {
    return {
      path: Boolean
    }
  },
  computed: mapGetters({
    users: 'users/all'
  }),
  watch: {
    $route () {
      if (this.$route.params) {
        this.path = false
      }
    }
  },
  mounted () {
    this.getUsers()
  },
  methods: {
    async getUsers () {
      await this.$store.dispatch('users/fetchUsers')
      console.log(this.users)
    }
  }
}
</script>
