import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {}

  dismiss(event) {
    let message = event.target.closest(".flash.notification");
    message.remove();
  }
}
