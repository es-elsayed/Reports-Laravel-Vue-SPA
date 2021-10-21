<template>
  <tr>
    <td>{{ task.title }}</td>
    <td>{{ task.project_name }}</td>
    <td>{{ task.date | formatDate }}</td>
    <td>{{ task.user_name }}</td>
    <td>{{ task.role }}</td>
    <td>{{ task.who_is_assign }}</td>
    <td>
      <div class="special-width">
        {{ task.description }}
      </div>
    </td>
    <td>{{ task.hours }}h : {{ task.minutes }}m</td>
  </tr>
</template>
<script>
export default {
  props: ['task']
}
</script>
<style scoped>
.special-width {
  width: 100%;
  height: 100px;
  overflow: auto;
}
</style>
