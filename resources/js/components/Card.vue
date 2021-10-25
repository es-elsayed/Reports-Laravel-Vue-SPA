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
div.card {
  border-radius: 25px !important;
}
h3.card-header {
  border-radius: 20px 20px 0px 0px;
    color: var(--sub-color);
    font-weight: bold;
    text-align: center;
  background-color: var(--main-color);
}
div.card-body {
  font-weight: bold;
  padding: 1rem 0.75rem 5px;
}

div.card-body input[type='email'],div.card-body input[type='password']{
  border: 1px solid var(--sub-color) !important;
}
</style>
