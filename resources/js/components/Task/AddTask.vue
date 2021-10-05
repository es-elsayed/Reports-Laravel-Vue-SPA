<template>
  <!-- <tr>
    <form @submit.prevent="addNewTask">
      <td>
        <input
          id="task_name"
          v-model="taskName"
          type="text"
          name="task_name"
          class="theme-input-style"
          placeholder="List Title"
        />
      </td>
      <td>
        <select
          id="project_name"
          v-model="projectName"
          name="project_name"
          class="form-select form-select-lg mb-3"
          aria-label=".form-select-lg example"
        >
          <option
            v-for="project in projects"
            :key="project.id"
            :value="project.title"
            >{{ project.title }}</option
          >
        </select>
      </td>
      <td>
        <input
          id="current_time"
          v-model="currentDate"
          class="form-control border border-info"
          type="date"
          name="current_time"
        />
      </td>
      <td>
        <select
          id="emp_role"
          v-model="role"
          name="emp_role"
          class="form-select form-select-lg mb-3"
          aria-label=".form-select-lg example"
        >
          <option v-for="user in users" :value="user.role" :key="user.id">{{
            user.role
          }}</option>
        </select>
      </td>
      <td>
        <select
          id="who"
          v-model="whoIsAssign"
          name="who"
          class="form-select form-select-lg mb-3"
          aria-label=".form-select-lg example"
        >
          <option v-for="user in users" :key="user.id" :value="user.name">{{
            user.name
          }}</option>
        </select>
      </td>
      <td class="special-width">
        <textarea
          id="description"
          v-model="description"
          name="description"
          class="text-area theme-input-style style--seven"
          placeholder="Type Here"
        />
      </td>
      <td>
        <div>
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
        <div>
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
      </td>
      <td class="special-width">
        <textarea
          id="difficulties"
          v-model="difficulties"
          name="difficulties"
          class="text-area theme-input-style style--seven"
          placeholder="Type Here"
        />
      </td>
      <td>
        <button type="submit" class="btn btn-primary">
          Submit
        </button>
      </td>
    </form>
  </tr> -->
  <!-- <tr>
    </tr>-->

  <div class="container">
    <div class="row">
      <form @submit.prevent="addNewTask">
        <div class="form-group">
          <label for="task_name">Task Name</label>
          <label v-if="!taskNameValidity" class="text-danger ms-5">
            *Please Enter Valid Name!
          </label>
          <input
            id="task_name"
            v-model.trim="taskName"
            type="text"
            name="task_name"
            class="text-input theme-input-style style--seven"
            placeholder="Task Name"
            @blur="validateTaskName"
          >
        </div>

        <div class=" form-group">
          <label for="project_name">Project Name</label>
          <label v-if="!projectNameValidity" class="text-danger ms-5">
            *Please Enter Valid Name!
          </label>
          <select
            id="project_name"
            v-model="projectName"
            name="project_name"
            class="form-select form-select-lg mb-3"
            aria-label=".form-select-lg example"
          >
            <option>Choose Project Name</option>
            <option
              v-for="project in projects"
              :key="project.id"
              :value="project.title"
            >
              {{ project.title }}
            </option>
          </select>
        </div>

        <div class="form-group">
          <label for="emp_role">Role</label>
          <label v-if="!roleValidity" class="text-danger ms-5">
            *Please Enter Valid Role!
          </label>
          <select
            id="emp_role"
            v-model="role"
            name="emp_role"
            class="form-select form-select-lg mb-3"
            aria-label=".form-select-lg example"
          >
            <option>Choose Role</option>
            <option v-for="user in users" :key="user.id" :value="user.role">
              {{ user.role }}
            </option>
          </select>
        </div>

        <div class="form-group">
          <label for="who">Who Is Assign</label>
          <label v-if="!whoValidity" class="text-danger ms-5">
            *Please Enter Valid Name!
          </label>
          <select
            id="who"
            v-model="whoIsAssign"
            name="who"
            class="form-select form-select-lg mb-3"
            aria-label=".form-select-lg example"
          >
            <option>Choose Who is Assign</option>

            <option v-for="user in users" :key="user.id" :value="user.name">
              {{ user.name }}
            </option>
          </select>
        </div>

        <div class="form-group my-4">
          <label for="description">Description</label>
          <textarea
            id="description"
            v-model="description"
            name="description"
            class="text-area theme-input-style style--seven"
            placeholder="Type Here"
          />
        </div>

        <div class="form-group">
          <label for="current_time" class="form-label">Current Date</label>
          <input
            id="current_time"
            v-model="currentDate"
            class="form-control border border-info"
            type="date"
            name="current_time"
          >
        </div>

        <div class="my-3">
          <div class="col-6 my-3">
            <label for="demo0" class="control-label"> Hours </label>
            <div class="input-group bootstrap-touchspin">
              <span
                class="input-group-btn input-group-prepend bootstrap-touchspin-injected"
              ><button
                class="btn btn-primary bootstrap-touchspin-down"
                type="button"
                @click="decrementHours"
              >
                -
              </button></span><input
                id="demo0"
                v-model="hours"
                type="text"
                name="demo0"
                class="form-control"
              ><span
                class="input-group-btn input-group-append bootstrap-touchspin-injected"
              ><button
                class="btn btn-primary bootstrap-touchspin-up"
                type="button"
                @click="incrementHours"
              >
                +
              </button></span>
            </div>
          </div>
          <div class="col-6 my-3">
            <label for="demo0" class="control-label">Minutes </label>
            <div class="input-group bootstrap-touchspin">
              <span
                class="input-group-btn input-group-prepend bootstrap-touchspin-injected"
              ><button
                class="btn btn-primary bootstrap-touchspin-down"
                type="button"
                @click="decrementMinutes"
              >
                -
              </button></span><input
                id="demo0"
                v-model="minutes"
                type="text"
                name="demo0"
                class="form-control"
              ><span
                class="input-group-btn input-group-append bootstrap-touchspin-injected"
              ><button
                class="btn btn-primary bootstrap-touchspin-up"
                type="button"
                @click="incrementMinutes"
              >
                +
              </button></span>
            </div>
          </div>
        </div>

        <div class="form-group my-4">
          <label for="difficulties">Difficulties Explanation</label>
          <textarea
            id="difficulties"
            v-model="difficulties"
            name="difficulties"
            class="text-area theme-input-style style--seven"
            placeholder="Type Here"
          />
        </div>

        <div class="col">
          <div class="row text-center">
            <div class="col">
              <button
                type="button"
                class="btn btn-danger btn-action"
                @click.stop="$emit('close')"
              >
                Close
              </button>
            </div>
            <div class="col">
              <button type="submit" class="btn btn-primary btn-action">
                Submit
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- -->
</template>
<script>
import axios from 'axios'
import { mapGetters } from 'vuex'

export default {
  props: ['projects', 'users'],
  emits: ['toggle-add-list', 'add-task', 'close'],
  data () {
    return {
      taskNameValidity: true,
      projectNameValidity: true,
      roleValidity: true,
      whoValidity: true,
      taskName: '',
      projectName: 'Choose Project Name',
      role: 'Choose Role',
      whoIsAssign: 'Choose Who is Assign',
      description: null,
      currentDate: null,
      difficulties: null,
      hours: 0,
      minutes: 0
    }
  },
  computed: mapGetters({
    user: 'auth/user',
    token: 'auth/token'
  }),
  watch: {
    // canSubmit () {
    //   if (
    //     this.taskName.trim() === '' ||
    //     this.role == null ||
    //     this.whoIsAssign == null ||
    //     this.description == null ||
    //     this.currentDate == null ||
    //     this.difficulties == null ||
    //     this.projectName == null
    //   ) {
    //     return (this.canSubmit = false)
    //   } else return (this.canSubmit = true)
    // },
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
    validateTaskName () {
      if (this.taskName === '') {
        this.taskNameValidity = false
      } else {
        this.taskNameValidity = true
      }
    },
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
      if (
        this.taskName === '' ||
        this.projectName === 'Choose Project Name' ||
        this.projectName === '' ||
        this.role === 'Choose Role' ||
        this.role === '' ||
        this.whoIsAssign === 'Choose Who is Assign' ||
        this.whoIsAssign === ''
      ) {
        this.taskNameValidity = false
        this.projectNameValidity = false
        this.roleValidity = false
        this.whoValidity = false
        return console.log('اكبر بقا وبطل لعب')
      }
      axios
        .post(`/api/reports/${this.$route.params.id}/tasks`, {
          title: this.taskName,
          project_name: this.projectName,
          role: this.role,
          report_id: this.$route.params.id,
          who_is_assign: this.whoIsAssign,
          description: this.description,
          current_date: this.currentDate,
          difficulties: this.difficulties,
          hours: this.hours,
          minutes: this.minutes,
          user_id: this.user.id
        })
        .then(res => console.log(res.data))
      this.taskName = null
      this.projectName = null
      this.role = null
      this.whoIsAssign = null
      this.description = null
      this.currentDate = null
      this.difficulties = null
      this.hours = 0
      this.minutes = 0
      this.$emit('add-task')
    }
  }
}
</script>
<style>
.text-area {
  height: 100px !important;
}
input[type='text'],
input[type='date'] {
  padding: 1.5rem;
}
.btn-action {
  padding-inline: 1.5rem;
  padding-block: 0.75rem;
  border-radius: 4px;
}
</style>
