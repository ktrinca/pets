class HomeController < ApplicationController
  respond_to :html
  
  def index
    @categories = Category.order(:name)
    @last_news  = Post.last_news.first(4)
  end  
end

