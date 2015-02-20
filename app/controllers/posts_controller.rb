class PostsController < ApplicationController
  def new
    @post = Post.new 
    @categories = Categories.all
  end

  def create 
  end	
end
