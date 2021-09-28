<template>
  <div class="col-xl-3 col-lg-4 col-sm-6">
    <!-- Project Box -->
    <div class="project-box one mb-30">
      <!-- Custom Checkbox -->
      <label class="custom-checkbox" style="display: none">
        <input type="checkbox" class="projectCheckbox" />
        <span class="checkmark"></span>
      </label>
      <!-- End Custom Checkbox -->

      <div class="d-flex justify-content-between align-items-center mb-20">
        <div class="">
          <a href="task-list.html"
            ><h4>{{ projectTitle }}</h4></a
          >
        </div>
        <div class="d-flex align-items-center">
          <!-- Starred -->
          <div class="star">
            <a href="#"
              ><img src="../../assets/img/svg/star.svg" alt="" class="svg"
            /></a>
          </div>
          <!-- End Starred -->

          <!-- Dropdown Button -->
          <div class="dropdown-button ml-3">
            <a
              href="#"
              class="d-flex align-items-center"
              data-toggle="dropdown"
            >
              <div class="menu-icon mr-0">
                <span></span>
                <span></span>
                <span></span>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              <div class="color-balls">
                <span class="color color1"></span>
                <span class="color color2"></span>
                <span class="color color3"></span>
                <span class="color color4"></span>
                <span class="color color5"></span>
                <span class="color color6"></span>
                <span class="color color7"></span>
                <span class="color color8"></span>
              </div>
              <a href="create-new.html" class="edit">Edit</a>
              <a href="#" class="select">Select</a>
              <a href="#" class="delete">Delete</a>
            </div>
          </div>
          <!-- End Dropdown Button -->
        </div>
      </div>

      <div class="d-flex justify-content-between align-items-end pt-1">
        <div class="font-12">
          <p class="mb-0 l-height">Last update</p>
          <p class="bold black">21 Jan 2019</p>
        </div>

        <!-- <div class="member"> -->
        <!-- <a href="#"><img src="../../assets/img/avatar/m27.png" alt="" /></a> -->
        <!-- <a href="#"><img src="../../assets/img/avatar/m12.png" alt="" /></a> -->
        <!-- <a href="#"><img src="../../assets/img/avatar/m2.png" alt="" /></a> -->
        <!-- </div> -->
      </div>
    </div>
    <!-- End Project Box -->
  </div>
</template>
<script>
export default {
  props: ["projectTitle"],
};
</script>
