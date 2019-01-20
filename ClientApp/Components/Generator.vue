<script>
import { mapState } from "vuex";
export default {
  methods: {
    get() {
      this.$store.dispatch("getItems");
    },
    clear() {
      this.$store.commit("clearLootItems");
    },
    decrement() {
      this.$store.commit("decrementAmount");
    },
    increment() {
      this.$store.commit("incrementAmount");
    },
    toggleMode() {
      this.$store.commit("toggleMode");
    }
  },
  computed: {
    howMuch: {
      get() {
        return this.$store.state.howMuch;
      },
      set(newVal) {
        this.$store.commit("setNewAmount", newVal);
      }
    },
    ...mapState(["mode"])
  }
};
</script>

<template>
  <div class="m-t-10">
    <div class="columns">
      <div class="column is-one-third-tablet">
        <p class="help">Количество вещей</p>
        <div class="field">
          <div class="control has-icons-left">
            <input type="number" v-model="howMuch" class="input" min="1">
            <span class="icon is-small is-left">
              <i class="fas fa-copy"></i>
            </span>
          </div>
        </div>
        <div class="field">
          <div class="control">
            <div class="field has-addons">
              <div class="control">
                <a href="#" @click.prevent="get" class="button is-primary">Получить</a>
              </div>
              <div class="control">
                <a href="#" @click.prevent="clear" class="button">Очистить</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="column one-quarter-tablet">
        <div class="buttons m-l-10 m-t-20">
          <a href="#" @click.prevent="decrement" class="button is-link has-text-weight-bold">-</a>
          <a href="#" @click.prevent="increment" class="button is-link has-text-weight-bold">+</a>
        </div>
      </div>
      <div class="column">
        <div class="level">
          <div class="level-left"></div>
          <div class="level-right">
            <div class="m-t-20">
                <template v-if="mode === 'main'">
                  <a href="#" @click.prevent="toggleMode" class="button is-success">
                    Заглянуть в сундучок
                    </a>
                  </template>
                <template v-if="mode === 'stash'">
                  <a href="#" @click.prevent="toggleMode" class="button is-warning">
                    Прочь из сундучка
                    </a>
                </template>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>