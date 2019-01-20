import Vue from "vue";
import App from "./Components/App";
import "bulma";
import "./Styles/helpers.scss";
import "@fortawesome/fontawesome-free/css/all.css";
import store from "./State/store";

window.vm = new Vue({
    el: "#app",
    store,
    render: createEl => createEl(App)
});

/*

TODO:
1. Make a router-based navigation (main view <-> stash) (or not?)
2. Refactor something probably?

*/