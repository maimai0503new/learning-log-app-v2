class HomeController < ApplicationController
  def index
    @new_arrivals = Post.published.includes(:user, :source).limit(10).order(created_at: :desc)
    
    # トレンドの簡易実装（投稿件数が多い順）
    @trending_web_pages = WebPageMetadatum.joins(:post)
      .group(:id).order('count(posts.id) DESC').limit(5)
    
    @trending_books = BookMetadatum.joins(:post)
      .group(:id).order('count(posts.id) DESC').limit(5)
  end
end
