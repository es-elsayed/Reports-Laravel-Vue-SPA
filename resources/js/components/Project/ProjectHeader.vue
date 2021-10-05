<template>
  <div class="col-12">
    <!-- Contact Header -->
    <div
      class="
        project-header
        d-flex
        align-items-md-center
        media
        flex-column flex-md-row
        bg-white
        mb-30
      "
    >
      <div
        class="
          project-header-left
          media-body
          d-flex
          align-items-center
          w-100
          mr-md-4
        "
      >
        <!-- Add Title -->
        <form class="flex-grow" @submit.prevent="createProject">
          <div class="row">
            <div class="col-4">
              <input
                v-model.trim="projectName"
                type="text"
                class="theme-input-style bold"
                placeholder="Report Name"
              >
            </div>
            <div class="col-4 m-auto">
              <!-- <label for="current_date" class="form-label">Current Date</label>
              <br> -->
              <input
                id="current_date"
                v-model="currentDate"
                class="form-control border border-info"
                type="date"
                name="current_date"
              >
            </div>
            <div class="col-2 m-auto">
              <button
                type="submit"
                :disabled="!canCreate"
                class="btn btn-primary"
              >
                Create
              </button>
            </div>
          </div>
        </form>
        <!-- End Add Title -->
      </div>

      <div
        class="
          project-header-right
          d-flex
          align-items-center
          justify-content-md-end
          flex-wrap
          mt-3 mt-md-0
        "
      >
        <!-- Create New Board -->
        <!-- <div class="create-new-board mb-2 mb-sm-0">
          <button type="button" class="btn btn-primary" @click.stop="createProject">
            Create
          </button>
        </div> -->
        <!-- End Create New Board -->

        <!-- Board Close -->
        <!-- <div class="">
          <a
            href="#"
            class="close-btn d-flex align-items-center justify-content-center"
          > hi
            <i class="icofont-close-line" />
          </a>
        </div> -->
        <!-- End Attachment Close -->
      </div>
    </div>
    <!-- End Board Header -->
  </div>
</template>
<script>
import axios from 'axios'
export default {
  props: ['userId'],
  emits: ['createdProjectSuccessfully'],
  data () {
    return {
      projectName: '',
      currentDate: null,
      canCreate: false
    }
  },
  watch: {
    projectName () {
      if (this.projectName.length >= 3) {
        return (this.canCreate = true)
      } else return (this.canCreate = false)
    },
    // currentDate () {
    //   if (this.currentDate === null) {
    //     const current = new Date()
    //     const date = `${current.getFullYear()}-${current.getMonth() +
    //       1}-${current.getDate()}`
    //     this.currentDate = date
    //   }
    // }
  },
  methods: {
    createProject () {
      if (this.projectName.length >= 3 && this.currentDate !== null) {
        axios
          .post('api/reports', {
            title: this.projectName,
            current_date: this.currentDate,
            user_id: this.userId
          })
          .then(res => console.log(res))
        this.projectName = ''
        console.log(this.currentDate)
        this.$emit('createdProjectSuccessfully')
      } else if (this.projectName.length >= 3 && this.currentDate === null) {
        const current = new Date()
        const date = `${current.getFullYear()}-${current.getMonth() +
          1}-${current.getDate()}`
        axios
          .post('api/reports', {
            title: this.projectName,
            current_date: date,
            user_id: this.userId
          })
          .then(res => console.log(res))
        this.projectName = ''
        console.log(this.currentDate)
        this.$emit('createdProjectSuccessfully')
      } else {
        return console.log('Error.. Please try again later!')
      }
    }
  }
}
</script>
