<template>
  <div>
    <ul>
      <li v-for="board in boards" :key="board.id">
        <a :href="'/boards/' + board.id">{{ board.title }}</a>
        <a :href="'/boards/' + board.id" data-confirm="確定刪除？" data-method="delete">刪除</a>
      </li>
    </ul>
  </div>
</template>

<script>
import R from "@rails/ujs";

export default {
  data: function () {
    return {
      boards: [],
    };
  },
  beforeCreate: function () {
    R.ajax({
      url: "/api/v1/boards.json",
      type: "GET",
      success: (data) => {
        this.boards = data;
      },
      error: function (err) {},
    });
  },
};
</script>

<style scoped>
</style>