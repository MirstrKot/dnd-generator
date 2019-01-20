<script>
import { mapState, mapActions } from "vuex";
export default {
  computed: {
    ...mapState(["isNavbarOpen"])
  },
  methods: {
    ...mapActions(["toggleNavbar"])
  }
};
</script>

<template>
  <section>
    <div class="container">
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <a href="/" class="navbar-item">
            <img
              src="https://cdn1.iconfinder.com/data/icons/customer-support-9/48/44_mail_service_dnd_do_not_disturb_message-128.png"
              alt="dnd"
            >
          </a>
          <a
            role="button"
            class="navbar-burger burger"
            :class="{'is-active': isNavbarOpen}"
            aria-label="menu"
            aria-expanded="false"
            data-target="mainNavbarMenu"
            @click="toggleNavbar"
          >
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
          </a>
        </div>
        <div id="mainNavbarMenu" class="navbar-menu" :class="{'is-active': isNavbarOpen}">
          <div class="navbar-start"></div>
          <div class="navbar-end">
            <div class="navbar-item">
              <div class="buttons">
                <a
                  href="https://github.com/MirstrKot/dnd-generator"
                  target="_blank"
                  class="button"
                >GitHub</a>
                <a
                  href="https://ru.wikipedia.org/wiki/Dungeons_%26_Dragons"
                  target="_blank"
                  class="button"
                >WTF IS DND</a>
              </div>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </section>
</template>