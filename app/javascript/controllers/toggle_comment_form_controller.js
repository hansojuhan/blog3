import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-comment-form"
export default class extends Controller {
  static targets = ["text", "form"]

  toggleForm() {
    // console.log(this.formTarget);
    // console.log(this.textTarget);
    this.formTarget.classList.toggle("hidden")
    this.textTarget.classList.toggle("hidden")
  }
}