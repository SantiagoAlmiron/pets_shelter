import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    userId: Number,
    current: String
  }

  update(event) {
    const newRole = event.target.value
    if (newRole === this.currentValue) return

    fetch(`/admin/users/${this.userIdValue}/update_role`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({ role: newRole })
    })
      .then(async (response) => {
        if (response.ok) {
          this.currentValue = newRole
          window.location.reload()  // recarga para mostrar flash en Rails
        } else {
          const data = await response.json()
          // Revertir select al valor anterior si falla
          event.target.value = this.currentValue
          // Opcional: podés mostrar un mensaje de error aquí en DOM si querés
          console.error(data.error || "Error al actualizar el rol")
        }
      })
      .catch(() => {
        event.target.value = this.currentValue
        console.error("Error de red")
      })
  }
}
