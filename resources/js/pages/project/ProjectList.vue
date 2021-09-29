<template>
  <div class="board-wrapper">
    <project-board />
    <add-task />
  </div>
</template>
<script>
import ProjectBoard from '../../components/Project/ProjectBoard.vue'
import AddTask from '../../components/Task/AddTask.vue'
export default {
  components: {
    ProjectBoard,
    AddTask
  }
}
</script>
