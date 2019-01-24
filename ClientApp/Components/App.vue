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

const VERSION = "2.1.1";

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
    },
    versionBadgeUrl() {
      return (
        "https://img.shields.io/badge/dndgen-v" + VERSION + "-brightgreen.svg"
      );
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
    <footer>
      <div class="has-text-centered m-t-20 m-b-20">
        <div class="columns is-vcentered is-mobile">
          <div class="column">
            <img :src="versionBadgeUrl" alt="DNDGen version">
          </div>
          <div class="column">
            <img src="https://circleci.com/gh/nikitades/dnd-generator.svg?style=shield&circle-token=dc6811e1a98a9449e6faad990b13e6a4244e2f66" alt="CircleCI Passing">
          </div>
          <div class="column">
            <img src="/made-with-bulma.png" alt="Made with Bulma" width="128" height="24">
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>

<style>
.unclosing > *.column {
  padding-top: 34px;
  padding-bottom: 35px;
}
</style>

