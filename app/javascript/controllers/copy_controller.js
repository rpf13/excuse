import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source", "button", "label"]

  async copy() {
    const text = this.sourceTarget.innerText.trim()

    if (!text) {
      return
    }

    try {
      await navigator.clipboard.writeText(text)
      this.showCopiedState()
    } catch (_error) {
      this.copyWithFallback(text)
      this.showCopiedState()
    }
  }

  copyWithFallback(text) {
    const helper = document.createElement("textarea")
    helper.value = text
    helper.setAttribute("readonly", "")
    helper.style.position = "absolute"
    helper.style.left = "-9999px"

    document.body.appendChild(helper)
    helper.select()
    document.execCommand("copy")
    document.body.removeChild(helper)
  }

  showCopiedState() {
    this.labelTarget.textContent = "Copied"
    this.buttonTarget.classList.add("is-copied")

    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.labelTarget.textContent = "Copy"
      this.buttonTarget.classList.remove("is-copied")
    }, 1400)
  }
}