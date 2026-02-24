import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["webFields", "bookFields", "sourceType"]

    connect() {
        this.toggleFields()
    }

    toggleFields() {
        const sourceType = this.sourceTypeTarget.value
        if (sourceType === "web_page") {
            this.webFieldsTarget.classList.remove("hidden")
            this.bookFieldsTarget.classList.add("hidden")
        } else if (sourceType === "book") {
            this.webFieldsTarget.classList.add("hidden")
            this.bookFieldsTarget.classList.remove("hidden")
        } else {
            this.webFieldsTarget.classList.add("hidden")
            this.bookFieldsTarget.classList.add("hidden")
        }
    }

    // URL入力時にプレビューをフェッチする（将来的な拡張用）
    fetchPreview(event) {
        const url = event.target.value
        if (url) {
            // プレビュー表示ロジック（ホットワイヤ経由でサーバーからプレビューを取得するなど）
        }
    }
}
