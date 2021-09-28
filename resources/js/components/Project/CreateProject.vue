<template>
  <section>
    <project-header></project-header>

    <project-board></project-board>
  </section>
</template>
<script>
import ProjectHeader from "./ProjectHeader.vue";
// import CreateCard from "./CreateCard.vue";
import ProjectBoard from "./ProjectBoard.vue";
export default {
  components: {
    ProjectHeader,
    // CreateCard,
    ProjectBoard,
  },
};
</script>
