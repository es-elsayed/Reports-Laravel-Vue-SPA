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
        <!-- Starred -->
        <div class="star mr-20">
          <router-link to="">
            <img src="../../assets/img/svg/star.svg" alt="" class="svg">
          </router-link>
        </div>
        <!-- End Starred -->

        <!-- Add Title -->
        <form class="add-title flex-grow" @submit.prevent="">
          <div class="row">
            <div class="col-4">
              <input
                ref="projectName"
                type="text"
                class="theme-input-style bold"
                placeholder="Report Name"
              >
            </div>
            <div class="col-4">
              <!-- <label for="current_date" class="form-label">Current Date</label>
              <br> -->
              <input
                id="current_date"
                ref="current_date"
                class="form-control border border-info"
                type="date"
                name="current_date"
              >
            </div>
            <!-- <div class="col-4"><button type="button" class="btn btn-primary" @click.stop="createProject">
            Create
          </button></div> -->
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
        <div class="create-new-board mb-2 mb-sm-0">
          <button type="button" class="btn btn-primary" @click.stop="createProject">
            Create
          </button>
        </div>
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
    return {}
  },
  methods: {
    createProject () {
      axios
        .post('api/reports', {
          title: this.$refs.projectName.value,
          current_date: this.$refs.current_date.value,
          user_id: this.userId
        })
        .then(res => console.log(res))
      this.$refs.projectName.value = ''
      console.log(this.$refs.current_date.value)
      this.$emit('createdProjectSuccessfully')
    }
  }
}
</script>
