import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form" ]
  static values = { formIndex: Number }

  switchForm(event) {
    this.formIndex = event.target.selectedIndex
    this.formTargets.forEach((formElement, index) => {
      formElement.hidden = index !== this.formIndex
    })
  }
}
