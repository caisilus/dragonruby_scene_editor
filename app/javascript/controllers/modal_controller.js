import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['form']

  connect() {
    console.log("connect!");
    console.log(this.formTarget);
    this.formTarget.addEventListener('turbo:submit-end', this.handleFormSubmission.bind(this));
  }

  cancel(e) {
    e.preventDefault();

    this.clearModal()
  }

  handleFormSubmission(e) {
    console.log(e)
    this.clearModal()
  }

  clearModal() {
    const modal = document.getElementById("modal");
    modal.innerHTML = "";
    modal.removeAttribute("src");
    modal.removeAttribute("complete");
  }
}
