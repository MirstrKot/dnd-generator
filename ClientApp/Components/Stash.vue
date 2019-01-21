<script>
import { mapState } from "vuex";
import LootItem from "../Elements/LootItem";
export default {
  computed: {
    ...mapState(["lootItemsFromIDB", "IDsOfItemsFromIDB"])
  },
  components: {
    LootItem
  }
};
</script>

<template>
  <div class="m-t-15 m-b-25" style="min-height: 400px;">
    <LootItem v-for="item in lootItemsFromIDB" :key="item.number" :item="item" class="m-b-15"/>
  </div>
</template>
