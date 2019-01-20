<script>
import TypeButton from "../Elements/TypeButton";
import { mapState } from "vuex";
export default {
  components: {
    TypeButton
  },
  computed: {
    ...mapState(["availableTypes"])
  },
  methods: {
    disableAll() {
      this.$store.commit("disableAllAvailableTypes");
    },
    enableAll() {
      this.$store.commit("enableAllAvailableTypes");
    }
  }
};
</script>


<template>
  <div>
    <p class="help">Тип вещей</p>

    <div class="columns">
      <div class="column">
        <div class="buttons">
          <TypeButton v-for="button in availableTypes" :key="button.id" :button="button"/>
        </div>
      </div>
      <div class="column">
        <div class="field has-addons">
          <div class="control">
            <a href="#" @click.prevent="enableAll" class="button">Добавить все</a>
          </div>
          <div class="control">
            <a href="#" @click.prevent="disableAll" class="button">Убрать все</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>