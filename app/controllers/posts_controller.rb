class PostsController < ApplicationController
  def new
    @post       = Post.new 
    @categories = Category.all
    @province_form_presenter = ProvinceFormPresenter.new(view_context)
  end

  def create 
  end	
end
