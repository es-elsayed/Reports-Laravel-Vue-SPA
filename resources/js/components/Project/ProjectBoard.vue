<template>
  <div class="board">
    <!-- Board Header -->
    <div
      class="
        board-header
        d-flex
        justify-content-between
        align-items-center
        mb-10
      "
    >
      <h4 class="c2">Things To Do</h4>
      <!-- Dropdown Button -->
      <div class="dropdown-button">
        <a href="#" class="d-flex align-items-center" data-toggle="dropdown">
          <div class="menu-icon justify-content-center style--two mr-0">
            <span />
            <span />
            <span />
          </div>
        </a>
        <div class="dropdown-menu dropdown-menu-right">
          <a href="#">Daily</a>
          <a href="#">Sort By</a>
          <a href="#">Monthly</a>
        </div>
      </div>
      <!-- End Dropdown Button -->
    </div>
    <!-- End Board Header -->

    <!-- Boards Cards -->
    <div class="board-cards ui-sortable" />
    <!-- End Boards Cards -->

    <!-- Board Composer -->
    <div
      class="
        board-composer
        flex-column
        d-flex
        align-items-center
        justify-content-center
      "
    >
      <a href="#" class="add-another-card" style="display: none">
        <img src="../../assets/img/svg/plus.svg" alt="" class="svg mr-1">
        <span class="font-14 bold c4">Add another card</span>
      </a>

      <!-- appear add task btn -->
      <create-appear
        v-if="!addTaskIsActive"
        @appear-create-task="toggelAddTask"
      />
      <!-- add task -->
      <create-task v-else @close-create-task="toggelAddTask" />
    </div>
    <!-- End Board Composer -->
  </div>
</template>
<script>
import CreateTask from '../Task/CreateTask.vue'
import CreateAppear from '../Task/CreateAppear.vue'
export default {
  components: { CreateTask, CreateAppear },
  data () {
    return {
      addTaskIsActive: false
    }
  },
  methods: {
    toggelAddTask () {
      this.addTaskIsActive = !this.addTaskIsActive
    }
  }
}
</script>
