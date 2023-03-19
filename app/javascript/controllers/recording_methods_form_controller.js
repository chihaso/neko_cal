import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "newForm" ]
  static values = { newFormIndex: Number }

  switchNewForm(event) {
    this.newFormIndex = event.target.selectedIndex
    this.newFormTargets.forEach((formElement, index) => {
      formElement.hidden = index !== this.newFormIndex
    })
  }
}
