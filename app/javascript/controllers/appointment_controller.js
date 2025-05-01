import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="appointment"
export default class extends Controller {
  static targets = ["modal"];

  connect() {
    document.addEventListener("turbo:submit-end", this.closeModal.bind(this));
  }

  disconnect() {
    document.removeEventListener(
      "turbo:submit-end",
      this.closeModal.bind(this),
    );
  }

  showModal() {
    let modal = document.getElementById("patient-modal");
    modal.showModal();
  }

  closeModal(event) {
    if (event.detail.success && this.hasModalTarget) {
      this.modalTarget.close();
      this.modalTarget.querySelector("form").reset();
    }
  }
}
