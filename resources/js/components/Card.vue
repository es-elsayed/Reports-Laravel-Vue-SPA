<template>
  <div class="card">
    <h3 v-if="title" class="card-header">
      {{ title }}
    </h3>

    <div class="card-body">
      <slot />
    </div>
  </div>
</template>

<script>
export default {
  name: 'Card',

  props: {
    title: { type: String, default: null }
  }
}
</script>
<style scoped>
:root {
  --main-color: #fdc106;
  --sub-color: #262626;
}
h3.card-header {
  border-radius: 20px 20px 0px 0px;
    color: #fdc106;
    font-weight: bold;
    text-align: center;
  background-color: #262626;
}
div.card-body {
  font-weight: bold;
  background-color: #f7f9fb;
}

</style>
