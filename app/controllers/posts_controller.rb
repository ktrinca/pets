class PostsController < BaseController
  before_filter :load_categories
  before_action :find_category

  def new
    @province_form_presenter = ProvinceFormPresenter.new(view_context)
    @post       = Post.new 
    @post.build_contact
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      flash[:notice] = 'Publicacion Creada!'
    else
      @post = Post.new
    end
    
    respond_with(@post, location: post_url(@post))
  end

  def show
    @post = Post.find(params[:id])
  end  

  private

  def post_params
    permitted_params.permit
  end

  def load_categories
    @categories = Category.all
  end

  def find_category
    @post = Category.find(params[:category_id])
  end
end
