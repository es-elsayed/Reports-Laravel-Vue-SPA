<template>
  <div class="container-fluid">
    <form @submit.prevent="addTask">
      <div class="row my-5">
        <h4 class="col-sm-4">
          <label for="title">Task Name</label>
        </h4>
        <div class="col-sm-8">
          <input
            id="title"
            v-model.trim="form.title"
            type="text"
            name="title"
            class="text-input theme-input-style style--seven"
            placeholder="Task Name"
          >
        </div>
        <has-error :form="form" field="title" />
      </div>

      <div class="row">
        <div class="col-xl mb-20">
          <label for="project_id" class="bold">Project Name</label>
          <select
            id="project_id"
            v-model="form.project_id"
            name="project_id"
            class="form-select form-select-lg mb-3"
            :class="{ 'is-invalid': form.errors.has('project_id') }"
          >
            <option>Choose Project Name</option>

            <option
              v-for="project in projects"
              :key="project.id"
              :value="project.id"
            >
              <!-- :selected="role.id == '1' ? true : false " -->
              {{ project.name }}
            </option>
          </select>
          <has-error :form="form" field="project_id" />
        </div>
        <div class="col-xl mb-20">
          <label for="who" class="bold">Who Is Assign</label>
          <select
            id="who"
            v-model="form.who_is_assign"
            name="who_is_assign"
            class="form-select form-select-lg mb-3"
            :class="{ 'is-invalid': form.errors.has('who_is_assign') }"
          >
            <option>Choose Who is Assign</option>
            <option v-for="user in users" :key="user.id" :value="user.id">
              {{ user.name }}
            </option>
          </select>
          <has-error :form="form" field="who_is_assign" />
        </div>
        <div v-if="reports.length > 1" class="col-xl mb-20">
          <label for="report Name" class="bold">Report Name</label>
          <select
            id="report_id"
            v-model="form.report_id"
            name="report_id"
            class="form-select form-select-lg mb-3"
            :class="{ 'is-invalid': form.errors.has('who_is_assign') }"
          >
            <option>Choose Report Name</option>

            <option
              v-for="report in reports"
              :key="report.id"
              :value="report.id"
            >
              {{ report.title }}
            </option>
          </select>
          <has-error :form="form" field="report_id" />
        </div>
      </div>

      <!-- description row -->
      <div class="form-group mb-4">
        <div class="col-sm-4">
          <h4 class="font-20 mb-3">
            <label for="description">Description</label>
          </h4>
        </div>
        <textarea
          id="description"
          v-model="form.description"
          name="description"
          class="theme-input-style style--seven"
          placeholder="Type Here"
        />
        <has-error :form="form" field="description" />
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
                  v-model="form.hours"
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
            <has-error :form="form" field="hours" />
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
                  v-model="form.minutes"
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
            <has-error :form="form" field="minutes" />
          </div>
        </div>
        <h5 v-if="timeError != ''" class="text-danger text-center">
          {{ timeError }}
        </h5>
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
import { mapGetters } from 'vuex'
import Form from 'vform'

export default {
  props: ['projects', 'users', 'reports'],
  emits: ['close'],
  data: () => ({
    form: new Form({
      title: '',
      who_is_assign: 'Choose Who is Assign',
      project_id: 'Choose Project Name',
      report_id: null,
      description: null,
      hours: 0,
      minutes: 0,
      user_id: null
    }),
    timeError: ''
  }),
  computed: mapGetters({
    user: 'auth/user',
    token: 'auth/token'
  }),
  watch: {
    'form.hours': {
      handler: function () {
        if (this.form.hours <= 0) {
          return (this.form.hours = 0)
        } else {
          this.timeError = ''
        }
      },
      deep: true
    },
    'form.minutes': {
      handler: function () {
        if (this.form.minutes <= 0) {
          return (this.form.minutes = 0)
        } else if (this.form.minutes >= 60) {
          this.form.hours++
          this.form.minutes = this.form.minutes - 60
        } else {
          this.timeError = ''
        }
      },
      deep: true
    }
  },
  methods: {
    async addTask () {
      // Submit the form.
      console.log(this.form)
      if (this.form.hours || this.form.minutes) {
        this.form.user_id = this.user.id
        const { data } = await this.form.post('/api/reports/tasks')

        if (data.status) {
          this.mustVerifyEmail = true
        } else {
          // successfull alert
          this.$swal('Task Added Successfully!!!')

          this.$router.push({ name: 'home' })
        }
      } else {
        this.form.minutes = null
        this.form.hours = null
        this.timeError = 'Sorry..! Enter Valid time before submit form'
        await this.form.post('/api/reports/tasks')
      }
      // this.form.errors = { hours: 'hi' }
      // console.log(this.form.errors)
      // Register the user.
    },
    // validateTaskName () {
    //   if (this.taskName === '') {
    //     this.taskNameValidity = false
    //   } else {
    //     this.taskNameValidity = true
    //   }
    // },
    incrementHours () {
      return this.form.hours++
    },
    decrementHours () {
      return this.form.hours--
    },
    incrementMinutes () {
      return this.form.minutes++
    },
    decrementMinutes () {
      return this.form.minutes--
    },
    // addNewTask () {
    //   if (
    //     this.taskName === '' ||
    //     this.projectName === 'Choose Project Name' ||
    //     this.projectName === '' ||
    //     this.whoIsAssign === 'Choose Who is Assign' ||
    //     this.whoIsAssign === ''
    //   ) {
    //     this.taskNameValidity = false
    //     this.projectNameValidity = false
    //     this.whoValidity = false
    //     return console.log('اكبر بقا وبطل لعب')
    //   }
    //   axios
    //     .post('/api/reports/tasks', {
    //       title: this.taskName,
    //       project_name: this.projectName,
    //       report_id: this.report_id,
    //       who_is_assign: this.whoIsAssign,
    //       description: this.description,
    //       difficulties: this.difficulties,
    //       hours: this.hours,
    //       minutes: this.minutes,
    //       user_id: this.user.id
    //     })
    //     .then(res => console.log(res.data.data))
    //   this.reportName = 'Choose Report Name'
    //   this.taskName = ''
    //   this.projectName = 'Choose Project Name'
    //   this.whoIsAssign = 'Choose Who is Assign'
    //   this.description = null
    //   this.difficulties = null
    //   this.hours = 0
    //   this.minutes = 0
    //   this.GoBack()
    //   this.$swal('Report Added Successfully!!!')
    //   // this.$emit('add-task')
    // },
    GoBack () {
      this.$router.back()
    }
  }
}
</script>
<style scoped>
/* * {
  color: #05374e;
} */

select,
input[type='text'],
input[type='date'] {
  border-radius: 50px;
}

textarea.theme-input-style.style--seven {
  height: 17rem;
}

.input-group.bootstrap-touchspin button.btn {
  width: 2.5rem;
  height: 2.5rem;
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
