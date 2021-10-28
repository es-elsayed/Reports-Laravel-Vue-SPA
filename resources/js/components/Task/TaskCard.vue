<template>
  <div class="card-style hover mb-3">
    <div class="bg-third py-2 px-3">
      <div class="row">
        <div class="col-2 time-style text-nowrap center">
          {{ task.hours | toTime }} : {{ task.minutes | toTime }}
        </div>
        <!-- <div class="col-2">{{task.project_name}}</div> -->
        <div class="col-10 text-right light-style pt-1">
          Assign By: {{ task.who_is_assign }}
        </div>
      </div>
    </div>
    <div class="bg-second py-3 px-3">
      <p class="light-style">
        {{ task.description }}
      </p>
    </div>
  </div>
</template>
<script>
export default {
  props: ['task', 'index']
}
</script>
<style scoped>
/* div.task-card {
  transition-duration: var(--main-duration);
  border-radius: 25px !important;
} */
</style>
