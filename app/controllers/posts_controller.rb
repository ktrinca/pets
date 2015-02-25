class PostsController < ApplicationController
  def new
    @post = Post.new 
    @categories = Category.all
  end

  def create 
  end	
end
