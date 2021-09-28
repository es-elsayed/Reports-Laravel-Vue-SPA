<template>
  <div class="add-card w-100" style="">
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
          <button
            type="button"
            @click.stop="$emit('close-create-task')"
            class="cancel font-14 bold mr-3"
          >
            Cancel
          </button>
          <router-link to="" class="btn save"> Save </router-link>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  emits: ["close-create-task"],
};
</script>
