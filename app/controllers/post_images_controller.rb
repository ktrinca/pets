class PostImagesController < BaseController
  before_action :find_category_post
  before_filter :load_categories
  
  def index
    @post_images = @post.post_images.sorted.page(params[:page])
    respond_with(@post_images, location: category_post_post_images_url)
  end

  def new
    @post_image = @post.post_images.build
  end
  
  def create
    @post_image = @post.post_images.build
    @post_image.image = params[:file]  
    @post_image.save
    render partial: 'post_images/post_image_row', layout: false, locals: { post_image: @post_image }
  end

  def sort
    params[:post_image].each_with_index do |item_image_id, i|
      item_image = @item.item_images.find_by(id: item_image_id)
      item_image.update(position: i + 1)
    end

    render nothing: true
  end	

  def destroy
    @post_image = PostImage.find(params[:id])
    flash[:notice] = 'La imagen fue eliminada!' if @post_image.destroy
    respond_with(@post_images, location: category_post_post_images_url) 
  end 

  private


  def find_category_post
    @post = Post.find(params[:post_id])
    @category = Category.find(params[:category_id])
  end

  def load_categories
    @categories = Category.all
  end  
end
