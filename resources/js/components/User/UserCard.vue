<template>
  <!-- :to="{ name: 'user.id.tasks', params: { id: user.id } }" -->
  <router-link
    :to="{ name: 'users.tasks.id', params: { id: user.id } }"
    class="col-sm-6 col-md-4 col-xl-3 mb-3"
  >
    <div class="col card hover">
      <div class="row my-3 justify-content-center">
        <div
          class="col-12 img"
          :style="'background-image:url(https://picsum.photos/200/300);'"
        />
      </div>
      <div class="row mb-3">
        <div class="col">
          <h5 class="light-style center mb-2">Today</h5>
          <div class="time-style text-nowrap center">06:30</div>
        </div>
        <div class="col">
          <h5 class="light-style center mb-2">Today</h5>
          <div class="time-style text-nowrap center">06:30</div>
        </div>
      </div>
      <div class="row mb-3">
        <h3 class="col-12 text-center text-main">{{ user.name }}</h3>
        <h5 class="col-12 text-center text-main te">{{ user.role }}</h5>
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
.card {
  background-color: var(--third-color);
  border: none;
  transition: all 500ms cubic-bezier(0.19, 1, 0.22, 1);
  overflow: hidden;
  border-radius: 20px;
  min-height: 22rem;
  box-shadow: 0 0 12px 0 rgba(0, 0, 0, 0.2);
  transition-duration: var(--main-duration);
}

.img {
  width: 8rem;
  height: 8rem;
  border-radius: 50% !important;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: 120%;
}

/*.card.card-has-bg {
  transition: all 500ms cubic-bezier(0.19, 1, 0.22, 1);
  background-size: 120%;
  background-repeat: no-repeat;
  background-position: center center;
}
.card.card-has-bg:before {
  content: '';
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background: inherit;
  -webkit-filter: grayscale(1);
  -moz-filter: grayscale(100%);
  -ms-filter: grayscale(100%);
  -o-filter: grayscale(100%);
  filter: grayscale(100%);
}
.card.card-has-bg:hover {
  transform: scale(0.98);
  box-shadow: 0 0 5px -2px rgba(0, 0, 0, 0.3);
  background-size: 130%;
  transition: all 500ms cubic-bezier(0.19, 1, 0.22, 1);
}
.card.card-has-bg:hover .card-img-overlay {
  transition: all 800ms cubic-bezier(0.19, 1, 0.22, 1);
  background: #234f6d;
  background: linear-gradient(0deg, rgba(4, 69, 114, 0.5) 0%, #044572 100%);
}
.card .card-footer {
  background: none;
  border-top: none;
}
.card .card-footer .media img {
  border: solid 3px rgba(234, 95, 0, 0.3);
}
.card .card-body {
  transition: all 500ms cubic-bezier(0.19, 1, 0.22, 1);
}
.card:hover {
  cursor: pointer;
  transition: all 800ms cubic-bezier(0.19, 1, 0.22, 1);
}
.card:hover .card-body {
  transition: all 800ms cubic-bezier(0.19, 1, 0.22, 1);
}
.card .card-img-overlay {
  transition: all 800ms cubic-bezier(0.19, 1, 0.22, 1);
  background: #234f6d;
  background: linear-gradient(
    0deg,
    rgba(35, 79, 109, 0.3785889356) 0%,
    #455f71 100%
  );
} */
</style>
