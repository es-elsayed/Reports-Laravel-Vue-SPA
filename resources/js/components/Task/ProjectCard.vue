<template>
  <div class="col-xl-3 col-lg-4 col-sm-6">
    <!-- Project Box -->
    <div class="project-box one mb-30">
      <!-- Custom Checkbox -->
      <label class="custom-checkbox" style="display: none">
        <input type="checkbox" class="projectCheckbox" />
        <span class="checkmark" />
      </label>
      <!-- End Custom Checkbox -->

      <div class="d-flex justify-content-between align-items-center mb-20">
        <div class="">
          <router-link to="">
            <h4>{{ task.title }}</h4></router-link
          >
        </div>
        <div class="d-flex align-items-center"></div>
      </div>

      <div class="d-flex justify-content-between align-items-end pt-1">
        <div class="font-12">
          <p class="mb-0 l-height">Created at</p>
          <p class="bold black">{{ task.current_date | formatDate }}</p>
        </div>
      </div>
    </div>
    <!-- End Project Box -->
  </div>
</template>
<script>
export default {
  // computed: {
  //   computedFun () {
  //     // return '/project/' + this.projectId + '/list'
  //     return { name: 'report.lists', params: { id: this.projectId } }
  //   }
  // },
  props: ['task']
}
</script>
