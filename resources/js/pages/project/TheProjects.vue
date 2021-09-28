<template>
  <!-- <card :title="'name of allah'">
   </card> -->
  <div class="container-fluid">
    <div class="row">
      <project-card
        v-for="project in projects"
        :key="project.id"
        :projectTitle="project.title"
      ></project-card>
      <!-- <div v-for="project in projects">{{ project.title }}</div> -->

      <create-project></create-project>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import ProjectCard from "../../components/Project/ProjectCard.vue";
import CreateProject from "../../components/Project/CreateCard.vue";
export default {
  data() {
    return {
      projects: [],
    };
  },
  components: { ProjectCard, CreateProject },
  mounted() {
    axios.get("/api/projects").then((res) => (this.projects = res.data));
  },
};
</script>
