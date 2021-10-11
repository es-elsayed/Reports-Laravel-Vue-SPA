<template>
  <tr>
    <td>{{ task.title }}</td>
    <td>{{ task.project_name }}</td>
    <td>{{ task.date | formatDate }}</td>
    <td>{{ task.user_name }}</td>
    <td>{{ task.role }}</td>
    <td>{{ task.who_is_assign }}</td>
    <td class="special-width">{{ task.description }}</td>
    <td>{{ task.hours }}h : {{ task.minutes }}m</td>
    <td class="special-width">{{ task.difficulties }}</td>
  </tr>
</template>
<script>
export default {
  props: ['task']
}
</script>
<style scoped>
.special-width{
  width: 25%;
}
</style>
