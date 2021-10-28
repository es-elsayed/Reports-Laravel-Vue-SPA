<template>
  <router-link
    :to="{ name: 'users.tasks.id', params: { id: user.id } }"
    class="col-sm-6 col-md-4 col-xl-3 mb-3"
  >
    <div class="col card-style hover">
      <div class="row my-3 justify-content-center">
        
        <img class="col-12 img" :src="user.image">
      </div>
      <div class="row mb-3">
        <div class="col">
          <h5 class="light-style center mb-2">
            Today
          </h5>
          <div class="time-style text-nowrap center">
            {{ user.today_hours | toTime }}
            :
            {{ user.today_minutes | toTime }}
          </div>
        </div>
        <div class="col">
          <h5 class="light-style center mb-2">
            Month
          </h5>
          <div class="time-style text-nowrap center">
            {{ user.month_hours | toTime }}
            :
            {{ user.month_minutes | toTime }}
          </div>
        </div>
      </div>
      <div class="row mb-3">
        <h3 class="col-12 text-center text-main">
          {{ user.name }}
        </h3>
        <h5 class="col-12 text-center text-main light-style">
          {{ user.job }}
        </h5>
      </div>
    </div>
  </router-link>
</template>
<script>
export default {
  props: ['user']
}
</script>

<style scoped>
a {
  text-decoration: none;
}
.card-style {
  min-height: 22rem;
  background-color: var(--third-color);
}

.img {
  width: 8rem;
  height: 8rem;
  border-radius: 50% !important;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: 120%;
  padding: 0;
}
</style>
