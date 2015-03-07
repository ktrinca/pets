class PostImageController < ApplicationController
  before_action :find_post
  
  def new
    @post_image = policy_scope(@post.post_images.build)
  end

  def create 
  end	

  private

  def find_item
    @post = Post.find(params[:post_id])
  end
end
