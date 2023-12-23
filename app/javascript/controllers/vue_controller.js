import { Controller } from "@hotwired/stimulus"
import { createApp } from "vue"
import App from "../components/App.vue"

// Connects to data-controller="vue"
export default class extends Controller {
  static targets = ["root"]

  connect() {
    console.log("here")
    createApp(App).mount(this.rootTarget)
  }
}
