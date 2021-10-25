<template>
  <!-- start custom -->
  <card :title="$t('home')">
    {{ $t('you_are_logged_in') }}
  </card>

  <!-- start default -->
  <!-- <div class="row">
    <div class="col-lg-10 m-auto">
      <card :title="$t('home')">
        {{ $t('you_are_logged_in') }}
      </card>
     </div>
  </div> -->
</template>

<script>
// import axios from 'axios'
import { mapGetters } from 'vuex'
export default {
  middleware: 'auth',
  computed: mapGetters({
    role: 'auth/role'
  }),
  metaInfo () {
    return { title: this.$t('home') }
  },
  created () {
    if (this.role === 'admin') {
      this.$router.push({ name: 'users' })
    } else {
      this.$router.push({ name: 'reports.add' })
    }
  }
}
</script>
