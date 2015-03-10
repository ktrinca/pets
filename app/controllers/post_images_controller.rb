class PostImagesController < BaseController
  before_action :find_category_post
  
  def index
    @post_images = @post.post_images.sorted.page(params[:page])
    respond_with(@post_images, location: category_post_post_images_url)
  end

  def new
    @post_image = policy_scope(@post.post_images.build)
  end

  def create 
  end

  def sort
    params[:post_image].each_with_index do |item_image_id, i|
      item_image = @item.item_images.find_by(id: item_image_id)
      item_image.update(position: i + 1)
    end

    render nothing: true
  end	

  private

  def find_category_post
    @post = Post.find(params[:post_id])
    @category = Category.find(params[:category_id])
  end
end
