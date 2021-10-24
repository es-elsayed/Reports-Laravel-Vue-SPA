<template>
  <nav class="navbar navbar-expand-lg bg-main text-white">
    <div class="container">
      <router-link
        :to="{ name: user ? 'home' : 'welcome' }"
        class="navbar-brand"
      >
        {{ appName }}
      </router-link>
      <div
        v-if="!toggleSidebar"
        class="offcanvas-overlay active"
        @click="showSidebar"
      />
      <div class="main-header-left h-100 d-flex align-items-center bg-transparent">
        <button
          class="navbar-toggler border-0"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbar"
        >
          <div class="menu-icon">
            <span class="bg-secondary" />
            <span class="bg-secondary" />
            <span class="bg-secondary" />
          </div>
        </button>
        <!-- <button class="navbar-toggler" type="button" @click="showSidebar">
          <span class="navbar-toggler-icon" />
        </button> -->
      </div>

      <div id="navbar" class="collapse navbar-collapse">
        <!-- <ul class="navbar-nav">
          <locale-dropdown />
        </ul> -->

        <ul class="navbar-nav ms-auto">
          <!-- Authenticated -->
          <li v-if="user" class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle text-dark"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              <img
                :src="user.photo_url"
                class="rounded-circle profile-photo me-1"
              >
              {{ user.name }}
            </a>
            <div class="dropdown-menu">
              <router-link
                :to="{ name: 'settings.profile' }"
                class="dropdown-item ps-3"
              >
                <fa icon="cog" fixed-width />
                {{ $t('settings') }}
              </router-link>

              <div class="dropdown-divider" />
              <a href="#" class="dropdown-item ps-3" @click.prevent="logout">
                <fa icon="sign-out-alt" fixed-width />
                {{ $t('logout') }}
              </a>
            </div>
          </li>
          <!-- Guest -->
          <template v-else>
            <li class="nav-item">
              <router-link
                :to="{ name: 'login' }"
                class="nav-link"
                active-class="active"
              >
                {{ $t('login') }}
              </router-link>
            </li>
          </template>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
import { mapGetters } from 'vuex'
import LocaleDropdown from './LocaleDropdown'

export default {
  components: {
    LocaleDropdown
  },

  data: () => ({
    appName: window.config.appName,
    toggleSidebar: {
      type: Boolean,
      default: false
    }
  }),

  computed: mapGetters({
    user: 'auth/user'
  }),

  methods: {
    async logout () {
      // Log out the user.
      await this.$store.dispatch('auth/logout')

      // Redirect to login.
      this.$router.push({ name: 'login' })
    },
    showSidebar () {
      if (this.toggleSidebar) {
        document.body.classList.add('sidebar-open')
        this.toggleSidebar = !this.toggleSidebar
      } else if (!this.toggleSidebar) {
        document.body.classList.remove('sidebar-open')
        this.toggleSidebar = !this.toggleSidebar
      }
    }
  }
}
</script>

<style scoped>
.profile-photo {
  width: 2rem;
  height: 2rem;
  margin: -0.375rem 0;
}

.container {
  max-width: 1100px;
}
</style>
