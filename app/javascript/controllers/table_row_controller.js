import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="table-row"
export default class extends Controller {
  static values = {
    href: String
  }

  click(e) {
    window.location = this.hrefValue;
  }

  innerButtonClick(e) {
    e.stopPropagation();
  }
}
