<template>
  <div class="container">
    <card>
      <div class="row">
        <user-card v-for="user in users" :key="user.id" :user="user" />
      </div>
    </card>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import UserCard from '../../../components/User/UserCard.vue'
export default {
  components: {
    UserCard
  },
  computed: mapGetters({
    users: 'users/all'
  }),
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
