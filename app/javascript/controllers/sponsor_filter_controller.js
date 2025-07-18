import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "list", "checkbox"]

  filter() {
    const filterValue = this.inputTarget.value.toLowerCase()

    this.checkboxTargets.forEach(checkbox => {
      const label = checkbox.nextElementSibling
      const text = label.textContent.toLowerCase()
      const show = text.includes(filterValue)
      checkbox.parentElement.style.display = show ? "" : "none"
    })
  }
}
