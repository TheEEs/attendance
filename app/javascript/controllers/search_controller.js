import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["searchInput", "clear"]
  connect() {
    this.clearTarget.addEventListener("click", ()=>{
      this.searchInputTarget.value = ''
    })
  }
}
