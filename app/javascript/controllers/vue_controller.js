import { Controller } from "@hotwired/stimulus"
import { createApp } from "vue"
import App from "../components/App.vue"
import VueKonva from "vue-konva"

// Connects to data-controller="vue"
export default class extends Controller {
  static targets = ["root"]

  connect() {
    const app = createApp(App);
    app.use(VueKonva);
    app.mount(this.rootTarget)
  }
}
