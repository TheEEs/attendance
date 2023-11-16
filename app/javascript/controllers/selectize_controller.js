import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

// Connects to data-controller="selectize"
export default class extends Controller {

  static targets = ["select"]

  connect() {
    $(this.selectTarget).selectize();
  }
}
