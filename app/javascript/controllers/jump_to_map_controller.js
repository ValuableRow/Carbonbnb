import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="jump-to-map"
export default class extends Controller {
  static targets = ["map"]

  scroll() {
    this.mapTarget.scrollIntoView();
  }

  connect() {
  }
}
