<template>
  <div>
    <p>{{ message }}</p>
    <Ad></Ad>
  </div>
</template>

<script>
import Ad from 'vue/components/ui/ad.vue'

export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  components: { Ad }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
  color: #ffffff;
}
</style>
