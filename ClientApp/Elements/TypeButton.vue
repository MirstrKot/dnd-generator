<template>
  <a href="#" class="button" :class="darkMarker" @click.prevent="select">{{button.name}}</a>
</template>

<script>
export default {
  data() {
    return {};
  },
  props: {
    button: Object
  },
  computed: {
    darkMarker() {
      return {
        "is-dark": !!this.button.selected,
        "is-light": !this.button.selected
      };
    }
  },
  methods: {
    select() {
      this.button.selected = !this.button.selected;
    }
  }
};
</script>