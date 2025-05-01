import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "results"];

  connect() {
    this.inputTarget.addEventListener("input", this.search.bind(this));
  }

  search() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
    }, 300);
  }
}
