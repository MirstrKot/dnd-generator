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
      this.$store.dispatch("saveLootItemToIDB", this.item);
    },
    deleteMe() {
      this.$store.dispatch("deleteLootItemFromIDB", this.item.uuid);
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
      return this.$store.state.IDsOfItemsFromIDB.indexOf(this.item.uuid) !== -1;
    },
    ...mapState(["mode"])
  }
};
</script>

<template>
  <div class="card">
    <header class="card-header">
      <p class="card-header-title"><i :class="item.icon" class="ra ra-lg ra-title-icon"></i> {{item.name}}</p>
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
                    :class="{'common': commonRarityClass}"
                    @click.prevent="markAs(rarityDict.COMMON)"
                    class="button is-small is-light"
                  >Обычное</a>
                  <a
                    href="#"
                    :class="{'rare': rareRarityClass}"
                    @click.prevent="markAs(rarityDict.RARE)"
                    class="button is-small is-light"
                  >Редкое</a>
                  <a
                    href="#"
                    :class="{'epic': epicRarityClass}"
                    @click.prevent="markAs(rarityDict.EPIC)"
                    class="button is-small is-light"
                  >Эпическое</a>
                  <a
                    href="#"
                    :class="{'legendary': legendaryRarityClass}"
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
<style scoped>
  .button.common, .button.common:focus, .button.common:hover {
    background: #BFBFBF;
    color: #FFFFFF;
  }
  .button.rare, .button.rare:focus, .button.rare:hover {
    background: #4572C4;
    color: #FFFFFF;
  }
  .button.epic, .button.epic:focus, .button.epic:hover {
    background: #6F30A0;
    color: #FFFFFF;
  }
  .button.legendary, .button.legendary:focus, .button.legendary:hover{
    background: #ed7d31;
    color: #FFFFFF;
  }
  .ra-title-icon {
      margin-right: 10px;
  }
</style>