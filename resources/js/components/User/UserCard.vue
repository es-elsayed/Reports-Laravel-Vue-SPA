<template>
  <router-link
    :to="{ name: 'user.id.tasks', params: { id: user.id } }"
    class="col-md-3 mb-3"
  >
    <div
      class="card text-white card-has-bg click-col"
      :style="'background-image:url(' + user.photo_url + ');'"
    >
      <!-- <img
        class="card-img d-none"
        :src="user.photo_url"
        alt="Goverment Lorem Ipsum Sit Amet Consectetur dipisi?"
      > -->
      <div class="card-img-overlay d-flex flex-column">
        <div class="card-body">
          <h6 class="text-warning text-uppercase mb-2">
            {{ user.role }}
          </h6>
          <!-- <h4 class="card-title mt-0 ">
            <a class="text-white" herf="#">Goverment Lorem Ipsum Sit Amet Consectetur dipisi?</a>
          </h4> -->
          <small><i class="far fa-clock" /> October 15, 2020</small>
        </div>
        <div class="card-footer">
          <div class="media">
            <!-- <img
              class="mr-3 rounded-circle"
              src="https://cdn0.iconfinder.com/data/icons/user-pictures/100/male-512.png"
              alt="Generic placeholder image"
              style="max-width:50px"
            > -->
            <div class="media-body">
              <h4 class="my-0 text-white d-block text-center">
                {{ user.name }}
              </h4>
              <!-- <small>Director of UI/UX</small> -->
            </div>
          </div>
        </div>
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
.card {
  border: none;
  transition: all 500ms cubic-bezier(0.19, 1, 0.22, 1);
  overflow: hidden;
  border-radius: 20px;
  min-height: 22rem;
  box-shadow: 0 0 12px 0 rgba(0, 0, 0, 0.2);
}
.card.card-has-bg {
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
  /* margin-top: 30px; */
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
}
</style>
