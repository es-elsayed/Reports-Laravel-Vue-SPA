<template>
  <div class="container">
    <div class="row">
      <form @submit.prevent="addNewTask">
        <div class=" form-row mb-20">
          <div class="col-sm-4">
            <label for="task_name">Task Name</label>
          </div>
          <div class="col-sm-8">
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
          <label v-if="!taskNameValidity" class="text-danger ms-5">
            *Please Enter Valid Name!
          </label>
        </div>

        <div class=" form-row mb-20">
          <div class="col-sm-4">
            <label for="project_name">Project Name</label>
          </div>
          <div class="col-sm-8">
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
          <label v-if="!projectNameValidity" class="text-danger ms-5">
            *Please Enter Valid Name!
          </label>
        </div>

        <div class="form-row mb-20">
          <div class="col-sm-4">
            <label for="who">Who Is Assign</label>
          </div>
          <div class="col-sm-8">
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
          <label v-if="!whoValidity" class="text-danger ms-5">
            *Please Enter Valid Name!
          </label>
        </div>

        <div v-if="reports.length > 1" class="form-row mb-20">
          <div class="col-sm-4">
            <label for="report Name">Report Name</label>
          </div>
          <div class="col-sm-8">
            <select
              id="report_id"
              v-model="report_id"
              name="report_id"
              class="form-select form-select-lg mb-3"
              aria-label=".form-select-lg example"
            >
              <option
                v-for="report in reports"
                :key="report.id"
                :value="report.id"
              >
                {{ report.title }}
              </option>
            </select>
          </div>
          <label v-if="!whoValidity" class="text-danger ms-5">
            *Please Enter Valid Name!
          </label>
        </div>

        <div class="form-row mb-20">
          <div class="col-sm-4">
            <label for="description">Description</label>
          </div>
          <div class="col-sm-8">
            <textarea
              id="description"
              v-model="description"
              name="description"
              class="text-area theme-input-style style--seven"
              placeholder="Type Here"
            />
          </div>
        </div>

        <div class="form-row mb-20">
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

        <div class="form-row mb-20">
          <div class="col-sm-4">
            <label for="difficulties">Difficulties Explanation</label>
          </div>
          <div class="col-sm-8">
            <textarea
              id="difficulties"
              v-model="difficulties"
              name="difficulties"
              class="text-area theme-input-style style--seven"
              placeholder="Type Here"
            />
          </div>
        </div>

        <div class="col">
          <div class="row text-center">
            <div class="col">
              <button
                type="button"
                class="btn btn-danger btn-action"
                @click.stop="GoBack"
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
  props: ['projects', 'users', 'reports'],
  emits: ['close'],
  data () {
    return {
      taskNameValidity: true,
      projectNameValidity: true,
      whoValidity: true,
      taskName: '',
      report_id: null,
      projectName: 'Choose Project Name',
      reportName: 'Choose Report Name',
      whoIsAssign: 'Choose Who is Assign',
      description: null,
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
      if (
        this.taskName === '' ||
        this.projectName === 'Choose Project Name' ||
        this.projectName === '' ||
        this.whoIsAssign === 'Choose Who is Assign' ||
        this.whoIsAssign === ''
      ) {
        this.taskNameValidity = false
        this.projectNameValidity = false
        this.whoValidity = false
        return console.log('اكبر بقا وبطل لعب')
      }
      axios
        .post('/api/reports/tasks', {
          title: this.taskName,
          project_name: this.projectName,
          report_id: this.report_id,
          who_is_assign: this.whoIsAssign,
          description: this.description,
          difficulties: this.difficulties,
          hours: this.hours,
          minutes: this.minutes,
          user_id: this.user.id
        })
        .then(res => console.log(res.data.data))
      this.reportName = 'Choose Report Name'
      this.taskName = ''
      this.projectName = 'Choose Project Name'
      this.whoIsAssign = 'Choose Who is Assign'
      this.description = null
      this.difficulties = null
      this.hours = 0
      this.minutes = 0
      this.GoBack()
      // this.$emit('add-task')
    },
    GoBack () {
      this.$router.back()
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
