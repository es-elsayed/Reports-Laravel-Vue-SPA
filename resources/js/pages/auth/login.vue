<template>
  <div class="row center-card">
    <div class="body"></div>
    <card class=" w-50 py-5 px-3">
      <div class="col text-center mb-3">
        <fa class="user-icon" icon="user" />
      </div>
      <div class="col-lg mx-auto mt-3">
        <form @submit.prevent="login" @keydown="form.onKeydown($event)">
          <!-- Email -->

          <div class="mb-4 row">
            <div class="col-md">
              <div class="input-group">
                <div class="input-group-prepend">
                  <div class="input-group-text">
                    <fa icon="user" />
                  </div>
                </div>
                <input
                  v-model="form.email"
                  :class="{ 'is-invalid': form.errors.has('email') }"
                  class="form-control"
                  type="email"
                  name="email"
                  placeholder="Type Email Address"
                />
                <has-error :form="form" field="email" />
              </div>
            </div>
          </div>
          <!-- Password -->
          <div class="mb-4 row">
            <div class="col-md">
              <div class="input-group">
                <div class="input-group-prepend">
                  <div class="input-group-text">
                    <fa icon="lock" />
                  </div>
                </div>
                <input
                  v-model="form.password"
                  :class="{ 'is-invalid': form.errors.has('password') }"
                  class="form-control"
                  type="password"
                  name="password"
                  placeholder="Type Password Here"
                />
                <has-error :form="form" field="password" />
              </div>
            </div>
          </div>

          <!-- Remember Me -->
          <div class="mb-4 row">
            <div class="col-md mb-4">
              <checkbox class="text-nowrap" v-model="remember" name="remember">
                {{ $t('remember_me') }}
              </checkbox>
            </div>
            <div class="col-md">
              <router-link
                :to="{ name: 'password.request' }"
                class="small ms-auto my-auto text-nowrap"
              >
                {{ $t('forgot_password') }}
              </router-link>
            </div>
          </div>

          <div class="mb-4 row">
            <div class="col-md d-flex">
              <!-- Submit Button -->
              <v-button class="w-100 bg-main text-white" :loading="form.busy">
                {{ $t('login') }}
              </v-button>

              <!-- GitHub Login Button -->
              <!-- <login-with-github /> -->
            </div>
          </div>
        </form>
      </div>
    </card>
  </div>
</template>

<script>
import Form from 'vform'
import Cookies from 'js-cookie'
// import LoginWithGithub from '~/components/LoginWithGithub'

export default {
  // components: {
  //   LoginWithGithub
  // },

  middleware: 'guest',

  metaInfo() {
    return { title: this.$t('login') }
  },

  data: () => ({
    form: new Form({
      email: '',
      password: ''
    }),
    remember: false
  }),

  methods: {
    async login() {
      // Submit the form.
      const { data } = await this.form.post('/api/login')

      // Save the token.
      this.$store.dispatch('auth/saveToken', {
        token: data.token,
        remember: this.remember
      })

      // Fetch the user.
      await this.$store.dispatch('auth/fetchUser')

      // Redirect home.
      this.redirect()
    },

    redirect() {
      const intendedUrl = Cookies.get('intended_url')

      if (intendedUrl) {
        Cookies.remove('intended_url')
        this.$router.push({ path: intendedUrl })
      } else {
        this.$router.push({ name: 'home' })
      }
    }
  }
}
</script>
<style scoped>
div.body {
  background-color: var(--main-color);
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
}
input {
  height: 3rem;
  background-color: var(--sub-color);
  /* display: contents; */
  outline: 1px solid var(--main-color) !important;
  border-radius: 25px;
}

svg.user-icon {
  width: 5rem;
  background: var(--main-color) !important;
  height: 5rem;
  padding: 0.5rem;
  color: #fff;
  border-radius: 50%;
}
.input-group-text {
  border-radius: 25px 0 0 25px !important;
  background: var(--main-color) !important;
  outline: 1px solid var(--main-color) !important;
  /* border: 1px solid var(--main-color) !important; */
  /* box-sizing: border-box; */
  color: #fff;
}
.center-card {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
}
button.bg-main {
  background-color: var(--main-color);
  transition: all 0.7s;
}
button.bg-main:hover {
  transform: scale(0.95);
}
</style>
