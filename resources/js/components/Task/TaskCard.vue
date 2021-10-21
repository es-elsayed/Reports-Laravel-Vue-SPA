<template>
  <section>
    <div class="row bg-main-row mb-3 px-2 text-center">
      <div class="col">
        <div class="row" :class="index % 2 == 0 ? 'even' : 'odd'">
          <div class="col-3 me-5">
            <div class="row">
              <div class="col-l-12 left-col m-2 p-3">
                {{ task.user_name }}
              </div>
              <div class="col-l-12 left-col m-2 p-3">
                {{ task.hours }}h : {{ task.minutes }}m
              </div>
            </div>
          </div>
          <div class="col-8 ">
            <div class="row">
              <div class="col-l-12 right-col m-2 p-3">
                {{ task.title }}
              </div>
              <div class="col-l-12 right-col m-2 p-3 special-width ">
                {{ task.description }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <hr class="m-2">
  </section>
  <!-- <tr>
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
  </tr> -->
</template>
<script>
export default {
  props: ['task', 'index']
}
</script>
<style scoped>
.special-width {
  font-size: x-large;
  width: 100%;
  height: 15rem;
  overflow: auto;
}
div.even div.left-col,
div.odd div.right-col {
  background-color: #262626;
  font-weight: bold;
  color: #fdc106;
  border-radius: 27px;
}
div.even div.right-col,
div.odd div.left-col {
  background-color: #fdc106a6;
  color: #262626;
  border-radius: 27px;
}
</style>
