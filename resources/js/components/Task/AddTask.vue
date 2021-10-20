<template>
  <div class="container-fluid">
    <form @submit.prevent="addNewTask">
      <div class="row my-5">
        <h4 class="col-sm-4">
          <label for="task_name">Task Name</label>
        </h4>
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

      <div class="row">
        <div class="col-xl-4 mb-20">
          <label for="project_name" class="bold">Project Name</label>
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
          <label v-if="!projectNameValidity" class="text-danger ms-5">
            *Please Enter Valid Name!
          </label>
        </div>
        <div class="col-xl-4 mb-20">
          <label for="who" class="bold">Who Is Assign</label>
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
          <label v-if="!whoValidity" class="text-danger ms-5">
            *Please Enter Valid Name!
          </label>
        </div>
      </div>

      <!-- <div v-if="reports.length > 1" class="form-row mb-20">
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
      </div> -->

      <!-- description row -->
      <div class="form-group mb-4">
        <div class="col-sm-4">
          <h4 class="font-20 mb-3">
            <label for="description">Description</label>
          </h4>
        </div>
        <textarea
          id="description"
          v-model="description"
          name="description"
          class="theme-input-style style--seven"
          placeholder="Type Here"
        />
      </div>

      <!-- time row -->
      <div class="row mb-20">
        <!-- Hours col -->
        <div class="col-xl-4 my-3">
          <div class="row">
            <h4 class="col-4">
              <label for="hours"> Hours </label>
            </h4>
            <div class="col-8">
              <div class="input-group warning bootstrap-touchspin">
                <span class="input-group-btn input-group-prepend"><button
                  class="btn text-light"
                  type="button"
                  @click="decrementHours"
                >
                  -
                </button></span><input
                  id="hours"
                  v-model="hours"
                  type="text"
                  name="hours"
                  class="form-control"
                ><span class="input-group-btn input-group-append"><button
                  class="btn text-light"
                  type="button"
                  @click="incrementHours"
                >
                  +
                </button></span>
              </div>
            </div>
          </div>
        </div>
        <!-- minutes col -->
        <div class="col-xl-4 offset-xl-2 my-3">
          <div class="row">
            <h4 class="col-4">
              <label for="minutes">Minutes </label>
            </h4>
            <div class="col-8">
              <div class="input-group warning bootstrap-touchspin">
                <span class="input-group-btn input-group-prepend"><button
                  class="btn text-light"
                  type="button"
                  @click="decrementMinutes"
                >
                  -
                </button></span><input
                  id="minutes"
                  v-model="minutes"
                  type="text"
                  name="minutes"
                  class="form-control"
                ><span class="input-group-btn input-group-append"><button
                  class="btn text-light"
                  type="button"
                  @click="incrementMinutes"
                >
                  +
                </button></span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row text-center">
        <!-- <div class="col">
          <button
            type="button"
            class="btn btn-danger btn-action"
            @click.stop="GoBack"
          >
            Back
          </button>
        </div> -->
        <div class="col-2 my-5">
          <button type="submit" class="btn btn-light px-5 py-3 submit">
            Submit
          </button>
        </div>
      </div>
    </form>
  </div>
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
      this.$swal('Report Added Successfully!!!')
      // this.$emit('add-task')
    },
    GoBack () {
      this.$router.back()
    }
  }
}
</script>
<style scoped>
* {
  color: #05374e;
}

select,
input[type='text'],
input[type='date'] {
  border-radius: 50px;
}

textarea.theme-input-style.style--seven {
  height: 17rem;
}

.input-group.bootstrap-touchspin button.btn {
  width: 3rem;
  height: 3rem;
  border-radius: 50%;
  top: 0px;
}
.input-group.bootstrap-touchspin .input-group-append button.btn {
  left: -34px;
}
.input-group.bootstrap-touchspin .input-group-prepend button.btn {
  left: 34px;
}
.input-group > .form-control:not(:first-child) {
  /* background-color: red; */
  text-align: center;
}
button.submit {
  font-weight: bolder;
  border-radius: 50px;
}
button.submit:hover {
  background-color: rgb(255, 194, 81);
  color: #fff;
}
button.btn.text-light {
  z-index: 9;
}
</style>
