<template>
  <div class="board w-100">
    <!-- Board Composer -->
    <div class="board-composer flex-column d-flex justify-content-center">
      <a
        href="#"
        class="add-another-card board-list style--two align-items-center"
        style=""
      >
        <div class="btn-circle style--three mr-2">
          <img
            src="../../assets/img/svg/plus_white.svg"
            alt=""
            class="svg"
          >
        </div>

        <h4 class="c4">Add another list</h4>
      </a>

      <div class="add-card add-another-list" style="display: none;">
        <form action="#">
          <input
            type="text"
            class="theme-input-style"
            placeholder="List Title"
          >
        </form>
      </div>
    </div>
    <!-- End Board Composer -->
  </div>
</template>
