import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visibility"
export default class extends Controller {
  static targets = [ "hideable" ]

  connect() {
    console.log("try")
  }

  

  toggleTargets() {
    console.log("masuk tak")
    this.hideableTargets.forEach((el) => {
      el.hidden = !el.hidden
    });
  }
}
