<template>
  <div
    @click="$emit('appear-create-task')"
    class="
      board-composer
      flex-column
      d-flex
      align-items-center
      justify-content-center
    "
  >
    <router-link to="" class="add-another-card" style="">
      <img src="../../assets/img/svg/plus.svg" alt="" class="svg mr-1" />
      <span class="font-14 bold c4">Add another card</span>
    </router-link>

    <div class="add-card w-100" style="display: none">
      <form action="#" method="POST">
        <textarea
          class="theme-input-style style--five"
          placeholder="List Title"
        ></textarea>

        <div class="d-flex align-items-center justify-content-between mt-2">
          <div class="date d-flex align-items-center">
            <img src="../../assets/img/svg/watch.svg" alt="" class="svg mr-1" />
            <span class="date-text">28 September</span>
          </div>

          <div class="actions">
            <a href="#" class="cancel font-14 bold mr-3"> Cancel </a>
            <a href="#" class="btn save"> Save </a>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>
<script>
export default {
  emits: ["appear-create-task"],
};
</script>
