class PostsController < ApplicationController
  def new
    @post       = Post.new 
    @categories = Category.all
    @province_form_presenter = ProvinceFormPresenter.new(view_context)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = message_after_create
    else
      @post = Post.new
    end
    respond_with(@post)
  end

  private

  def post_params
    permitted_params.permit
  end	
end
