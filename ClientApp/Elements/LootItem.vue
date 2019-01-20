<script>
import { mapState } from "vuex";

const RARITY = {
  COMMON: 0,
  RARE: 1,
  EPIC: 2,
  LEG: 3
};

export default {
  data() {
    return {
      rarity: null,
      rarityDict: RARITY
    };
  },
  methods: {
    markAs(rarityValue) {
      this.item.rarity = rarityValue;
    },
    saveMe() {
      console.log(this.item.description);
      this.$store.dispatch("saveLootItemToIDB", this.item);
    },
    deleteMe() {
      this.$store.dispatch("deleteLootItemFromIDB", this.item.id);
    },
    updateMe() {
      this.$store.dispatch("saveLootItemToIDB", this.item);
    }
  },
  props: ["item"],
  computed: {
    commonRarityClass() {
      return this.item.rarity === RARITY.COMMON;
    },
    rareRarityClass() {
      return this.item.rarity === RARITY.RARE;
    },
    epicRarityClass() {
      return this.item.rarity === RARITY.EPIC;
    },
    legendaryRarityClass() {
      return this.item.rarity === RARITY.LEG;
    },
    isItemInStash() {
      if (!this.item) return false;
      return this.$store.state.IDsOfItemsFromIDB.indexOf(this.item.id) !== -1;
    },
    ...mapState(["mode"])
  }
};
</script>

<template>
  <div class="card">
    <header class="card-header">
      <p class="card-header-title">{{item.name}}</p>
      <div class="card-header-icon">
        <div class="buttons">
          <a
            v-if="mode === 'stash'"
            href="#"
            @click.prevent="updateMe"
            class="button is-small"
          >Обновить</a>
          <a
            v-if="!isItemInStash"
            href="#"
            @click.prevent="saveMe"
            class="button is-primary is-small"
          >В сундучок</a>
          <a
            v-if="isItemInStash"
            href="#"
            @click.prevent="deleteMe"
            class="button is-danger is-small"
          >Выкинуть из сундучка</a>
        </div>
      </div>
    </header>
    <div class="card-content">
      <div class="field">
        <div class="columns">
          <div class="column">
            <span class="tag is-link">{{item.type_name}}</span>
            <span class="tag is-info">{{item.category_name}}</span>
          </div>
          <div class="column has-text-right">
            <div class="level">
              <div class="level-left"></div>
              <div class="level-right">
                <div class="buttons is-grouped has-addons has-text-align-right">
                  <a
                    href="#"
                    :class="{'is-dark': commonRarityClass}"
                    @click.prevent="markAs(rarityDict.COMMON)"
                    class="button is-small is-light"
                  >Обычное</a>
                  <a
                    href="#"
                    :class="{'is-info': rareRarityClass}"
                    @click.prevent="markAs(rarityDict.RARE)"
                    class="button is-small is-light"
                  >Редкое</a>
                  <a
                    href="#"
                    :class="{'is-link': epicRarityClass}"
                    @click.prevent="markAs(rarityDict.EPIC)"
                    class="button is-small is-light"
                  >Эпическое</a>
                  <a
                    href="#"
                    :class="{'is-warning': legendaryRarityClass}"
                    @click.prevent="markAs(rarityDict.LEG)"
                    class="button is-small is-light"
                  >Легендарное</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="field">
        <div class="control">
          <textarea
            cols="15"
            rows="3"
            v-model="item.description"
            class="textarea is-info"
            placeholder="Заметки"
          ></textarea>
        </div>
      </div>
    </div>
  </div>
</template>
