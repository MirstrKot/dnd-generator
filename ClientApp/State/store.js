import Vuex from "vuex";
import Vue from "vue";
import axios from "axios";
import qs from "query-string";
import idbStore from "../IDB";
window.idbStore = idbStore;

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
        mode: "main",
        isNavbarOpen: false,
        gettingTypes: false,
        availableTypes: [],
        givenItems: [],
        howMuch: 3,
        loadingNewItems: false,
        loot: [],
        savingItem: false,
        lootItemsFromIDB: [],
        IDsOfItemsFromIDB: []
    },
    actions: {
        toggleNavbar(ctx) {
            ctx.commit("toggleNavbar");
        },
        async getAvailableTypes(ctx) {
            ctx.commit("acquireAvailableTypes");
            const response = await axios.get("/getStartInfo/");
            ctx.commit("setAvailableTypes", response.data.types.map(item => Object.assign(item, { selected: true })));
        },
        async getItems(ctx) {
            ctx.commit("loadNewItems");
            const response = await axios.post("/getItems/", qs.stringify({
                count: ctx.state.howMuch,
                "types[]": ctx.state.availableTypes.filter(item => !!item.selected).map(item => item.id)
            }),
                { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }
            );
            const loot = response.data.result.map((item, number) => {
                item.number = number;
                item.rarity = null; //TODO рандомизировать рарность на клиенте
                item.description = "";
                return item;
            });
            ctx.commit("setNewLoot", loot);
            const oldTypes = ctx.state.availableTypes;
            const newTypes = response.data.types.map(item => {
                const oldType = oldTypes.find(oldItem => oldItem.id === item.id);
                if (!!oldType) item.selected = !!oldType.selected;
                return item;
            });
            ctx.commit("setAvailableTypes", newTypes);
        },
        async getItemsFromIDB(ctx) {
            const goldenStashItemsIDS = await idbStore.goldenStash.allKeys();
            ctx.state.IDsOfItemsFromIDB = goldenStashItemsIDS;
            const goldenStashItems = await idbStore.goldenStash.all();
            goldenStashItems.map((item, number) => {
                item.number = number;
            })
            ctx.state.lootItemsFromIDB = goldenStashItems;
        },
        async saveLootItemToIDB(ctx, lootItem) {
            ctx.commit("startChangingLootItemToIDB", lootItem.id);
            await idbStore.goldenStash.set(lootItem);
            ctx.state.lootItemsFromIDB = ctx.state.lootItemsFromIDB.filter(item => item.id !== lootItem.id); //no dubs
            ctx.state.lootItemsFromIDB.push(lootItem);
            ctx.state.IDsOfItemsFromIDB = ctx.state.IDsOfItemsFromIDB.filter(itemID => itemID !== lootItem.id); //no dubs
            ctx.state.IDsOfItemsFromIDB.push(lootItem.id);
            ctx.commit("finishChangingLootItemToIDB");
        },
        async deleteLootItemFromIDB(ctx, lootItemID) {
            ctx.commit("startChangingLootItemToIDB", lootItemID);
            await idbStore.goldenStash.delete(lootItemID);
            ctx.state.lootItemsFromIDB = ctx.state.lootItemsFromIDB.filter(item => item.id !== lootItemID);
            ctx.state.IDsOfItemsFromIDB = ctx.state.IDsOfItemsFromIDB.filter(idbID => idbID !== lootItemID);
            ctx.commit("finishChangingLootItemToIDB");
        }
    },
    mutations: {
        toggleMode(state) {
            state.mode === "main" ? state.mode = "stash" : state.mode = "main";
        },
        toggleNavbar(state) {
            state.isNavbarOpen = !state.isNavbarOpen;
        },
        acquireAvailableTypes(state) {
            state.gettingTypes = true;
        },
        setAvailableTypes(state, data) {
            state.gettingTypes = false;
            state.availableTypes = data;
        },
        disableAllAvailableTypes(state) {
            state.availableTypes = state.availableTypes.filter(item => (item.selected = false) || true);
        },
        enableAllAvailableTypes(state) {
            state.availableTypes = state.availableTypes.filter(item => (item.selected = true) || true);
        },
        setNewAmount(state, newVal) {
            state.howMuch = newVal;
        },
        incrementAmount(state) {
            state.howMuch++;
        },
        decrementAmount(state) {
            state.howMuch = state.howMuch - 1;
            if (state.howMuch < 1) state.howMuch = 1;
        },
        loadNewItems(state) {
            state.loadingNewItems = true;
            state.loot = [];
        },
        setNewLoot(state, items) {
            state.loadingNewItems = false;
            state.loot = items;
        },
        clearLootItems(state) {
            state.loot = [];
        },
        startChangingLootItemToIDB(state, lootItemID) {
            state.saveLootItemToIDB = lootItemID;
        },
        finishChangingLootItemToIDB(state) {
            state.saveLootItemToIDB = false;
        },
        fillStashFromIDB(state, lootItemsFromIDB) {
            state.lootItemsFromIDB = lootItemsFromIDB;
        }
    }
});