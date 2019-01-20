<script>
import NavBar from "./NavBar";
import Hero from "./Hero";
import AvailableTypes from "./AvailableTypes";
import Generator from "./Generator";
import Items from "./Items";
import Stash from "./Stash";

const MODES = {
  MAIN: "main",
  STASH: "stash"
};

export default {
  components: {
    NavBar,
    Hero,
    AvailableTypes,
    Generator,
    Items,
    Stash
  },
  computed: {
    mode() {
      return this.$store.state.mode;
    },
    modes() {
      return MODES;
    }
  },
  beforeCreate() {
    this.$store.dispatch("getAvailableTypes");
    this.$store.dispatch("getItemsFromIDB");
  }
};
</script>

<template>
  <div>
    <NavBar/>
    <Hero/>
    <div class="section">
      <div class="container">
        <div class="m-l-10 m-r-10">
          <AvailableTypes/>
          <Generator/>
          <template v-if="mode === modes.MAIN">
            <Items/>
          </template>
          <template v-if="mode === modes.STASH">
            <Stash/>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
.unclosing > *.column {
  padding-top: 34px;
  padding-bottom: 35px;
}
</style>

