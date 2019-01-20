<script>
import { mapState } from "vuex";
import LootItem from "../Elements/LootItem";
export default {
  computed: {
    ...mapState(["loot"])
  },
  components: {
    LootItem
  }
};
</script>

<template>
  <div class="m-t-15 m-b-25" style="min-height: 400px;">
    <LootItem v-for="item in loot" :key="item.number" :item="item" class="m-b-15"/>
  </div>
</template>