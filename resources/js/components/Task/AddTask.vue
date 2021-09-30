<template>
  <div class="container">
    <div class="row">
      <form @submit.prevent="addNewTask">
        <div class="form-group">
          <label for="task_name">Task Name</label>
          <input
            id="task_name"
            ref="task_name"
            type="text"
            name="task_name"
            class="theme-input-style"
            placeholder="List Title"
          />
        </div>
        <div class=" form-group">
          <label for="project_name">Project Name</label>
          <select
            id="project_name"
            name="project_name"
            ref="project_name"
            class="form-select form-select-lg mb-3"
            aria-label=".form-select-lg example"
          >
            <!-- <option selected>Open this select menu</option> -->
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
          </select>
        </div>

        <div class="form-group">
          <label for="emp_role">Role</label>
          <select
            id="emp_role"
            name="emp_role"
            ref="emp_role"
            class="form-select form-select-lg mb-3"
            aria-label=".form-select-lg example"
          >
            <!-- <option selected>Open this select menu</option> -->
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
          </select>
        </div>

        <div class="form-group">
          <label for="who">Who Is Assign</label>
          <select
            id="who"
            name="who"
            ref="who"
            class="form-select form-select-lg mb-3"
            aria-label=".form-select-lg example"
          >
            <!-- <option selected>Open this select menu</option> -->
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
          </select>
        </div>

        <div class="form-group my-4">
          <label for="description">Description</label>
          <textarea
            id="description"
            ref="description"
            name="description"
            class="text-area theme-input-style style--seven"
            placeholder="Type Here"
          />
        </div>
        <div class="form-group">
          <label for="current_time" class="form-label">Current Date</label>
          <input
            id="current_time"
            ref="current_time"
            class="form-control border border-info"
            type="date"
            name="current_time"
          />
        </div>
        <div class="my-3">
          <!-- This is four Minutes -->
          <div class="col-6 my-3">
            <label for="demo0" class="control-label"> Hours </label>
            <div class="input-group bootstrap-touchspin">
              <span
                class="input-group-btn input-group-prepend bootstrap-touchspin-injected"
                ><button
                  @click="decrementHours"
                  class="btn btn-primary bootstrap-touchspin-down"
                  type="button"
                >
                  -
                </button></span
              ><input
                id="demo0"
                type="text"
                v-model="hours"
                name="demo0"
                class="form-control"
              /><span
                class="input-group-btn input-group-append bootstrap-touchspin-injected"
                ><button
                  @click="incrementHours"
                  class="btn btn-primary bootstrap-touchspin-up"
                  type="button"
                >
                  +
                </button></span
              >
            </div>
          </div>
          <!-- This is four Minutes -->
          <div class="col-6 my-3">
            <label for="demo0" class="control-label">Minutes </label>
            <div class="input-group bootstrap-touchspin">
              <span
                class="input-group-btn input-group-prepend bootstrap-touchspin-injected"
                ><button
                  @click="decrementMinutes"
                  class="btn btn-primary bootstrap-touchspin-down"
                  type="button"
                >
                  -
                </button></span
              ><input
                id="demo0"
                type="text"
                v-model="minutes"
                name="demo0"
                class="form-control"
              /><span
                class="input-group-btn input-group-append bootstrap-touchspin-injected"
                ><button
                  @click="incrementMinutes"
                  class="btn btn-primary bootstrap-touchspin-up"
                  type="button"
                >
                  +
                </button></span
              >
            </div>
          </div>
        </div>
        <div class="form-group my-4">
          <label for="difficulties">Difficulties Explanation</label>
          <textarea
            id="difficulties"
            ref="difficulties"
            name="difficulties"
            class="text-area theme-input-style style--seven"
            placeholder="Type Here"
          />
        </div>
        <div class="col-auto">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </form>
    </div>
  </div>
  <!-- <div class="board w-100">
    <div @click="$emit('toggle-add-list')"  class="board-composer flex-column d-flex justify-content-center">
      <router-link to=""
        class="add-another-card board-list style--two align-items-center"
        style=""
      >
        <div class="btn-circle style--three mr-2">
          <img
            src="../../assets/img/svg/plus_white.svg"
            alt=""
            class="svg"
          >
        </div>

        <h4 class="c4">Add another list</h4>
      </router-link>
    </div>
  </div> -->
</template>
<script>
import axios from 'axios'
import { mapGetters } from 'vuex'

export default {
  emits: ['toggle-add-list'],
  data () {
    return {
      hours: 0,
      minutes: 0
    }
  },
  computed: mapGetters({
    user: 'auth/user',
    token: 'auth/token'
  }),
  watch: {
    hours () {
      if (this.hours <= 0) {
        return (this.hours = 0)
      }
    },
    minutes () {
      if (this.minutes <= 0) {
        return (this.minutes = 0)
      }
      if (this.minutes >= 60) {
        this.hours++
        this.minutes = this.minutes - 60
      }
    }
  },
  methods: {
    incrementHours () {
      return this.hours++
    },
    decrementHours () {
      return this.hours--
    },
    incrementMinutes () {
      return this.minutes++
    },
    decrementMinutes () {
      return this.minutes--
    },
    addNewTask () {
      // return console.log(this.$route.params.id);
      axios
        .post(`/api/reports/${this.$route.params.id}/tasks`, {
          title: this.$refs.task_name.value,
          report_id: this.$route.params.id,
          who_is_assign: 'static',
          project_name: this.$refs.project_name.value,
          role: 'static eng.',
          description: this.$refs.description.value,
          difficulties: this.$refs.difficulties.value,
          hours: this.hours,
          minutes: this.minutes,
          user_id: this.user.id
        })
        .then(res => console.log(res.data))
    }
  }
}
</script>
<style>
.text-area {
  height: 100px !important;
}
</style>
