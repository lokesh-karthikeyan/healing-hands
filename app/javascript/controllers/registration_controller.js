import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="registration"
export default class extends Controller {
  connect() {}

  showModal() {
    let modal = document.getElementById("registration-modal");
    modal.showModal();
    this.showSignInForm(modal);
  }

  showSignInForm(modal) {
    let signInTemplate = modal.querySelector(".sign-in");
    let signInContent = document.querySelector(".sign-in-content");

    if (signInContent) {
      signInContent.style.display = "";
      return;
    }

    let signInForm = signInTemplate.content.cloneNode(true);
    modal.append(signInForm);
  }

  showSignUpForm(modal) {
    let signUpTemplate = modal.querySelector(".sign-up");
    let signUpContent = document.querySelector(".sign-up-content");

    if (signUpContent) {
      signUpContent.style.display = "";
      return;
    }

    let signUpForm = signUpTemplate.content.cloneNode(true);
    modal.append(signUpForm);
  }

  hideSignInForm() {
    let signInForm = document.querySelector(".sign-in-content");
    signInForm.style.display = "none";
  }

  hideSignUpForm() {
    let signUpForm = document.querySelector(".sign-up-content");
    signUpForm.style.display = "none";
  }

  toggleSignUpForm() {
    let modal = document.getElementById("registration-modal");
    modal.classList.add("toggle");

    setTimeout(() => {
      modal.classList.remove("toggle");
      this.showSignUpForm(modal);
      this.hideSignInForm();
    }, 300);
  }

  toggleSignInForm() {
    let modal = document.getElementById("registration-modal");
    modal.classList.add("toggle");

    setTimeout(() => {
      modal.classList.remove("toggle");
      this.showSignInForm(modal);
      this.hideSignUpForm();
    }, 300);
  }
}
