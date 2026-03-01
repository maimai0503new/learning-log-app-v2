import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like-button"
export default class extends Controller {
  static targets = ["button", "icon", "count"]

  like() {
    this.buttonTarget.classList.add("qiita-like-inline--active")
    this.countTarget.style.fontWeight = "700"
    this.countTarget.textContent = parseInt(this.countTarget.textContent) + 1

    // 3. アイコンを「塗りつぶしハート」に一瞬で切り替える
    this.iconTarget.setAttribute("fill", "currentColor")
    this.iconTarget.setAttribute("stroke", "none")
    this.iconTarget.setAttribute("viewBox", "0 0 20 20")
    this.iconTarget.innerHTML = `<path d="M3.172 5.172a4 4 0 015.657 0L10 6.343l1.172-1.171a4 4 0 115.657 5.657L10 17.657l-6.828-6.829a4 4 0 010-5.656z"/>`
  }

  unlike() {
    this.buttonTarget.classList.remove("qiita-like-inline--active")
    this.countTarget.style.fontWeight = "normal"
    this.countTarget.textContent = parseInt(this.countTarget.textContent) - 1

    // 3. アイコンを「塗りつぶしハート」に一瞬で切り替える
    this.iconTarget.setAttribute("fill", "none")
    this.iconTarget.setAttribute("stroke", "currentColor")
    this.iconTarget.setAttribute("viewBox", "0 0 24 24")
    this.iconTarget.innerHTML = `<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
      d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/>`
  }
}
