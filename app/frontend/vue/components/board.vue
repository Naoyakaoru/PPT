<template>
  <div>
    <li v-for="board in boards">{{ board }}</li>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      boards: [],
    };
  },
};
</script>

<style scoped>
  
</style>