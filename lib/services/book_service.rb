module Services
  class BookService
    def self.search(query)
      # Google Books API 等を使用して書籍を検索し、候補を返す
      # TODO: APIキーの設定や実際のHTTPリクエストの実装
      # 現時点ではスタブを返す（フロントエンド実装の準備のため）
      [
        { title: "リーダブルコード", author: "Dustin Boswell", ndc_code: "007", ndc_label: "情報学" },
        { title: "達人プログラマー", author: "Andrew Hunt", ndc_code: "007", ndc_label: "情報学" }
      ]
    end

    def self.fetch_details(google_books_id)
      # 詳細情報を取得し、NDCを特定する
      # ジャンル名等からNDCへの簡易マッピングをここで行う
    end
  end
end
