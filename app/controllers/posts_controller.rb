class PostsController < BaseController
  before_filter :load_categories
  before_action :find_category

  def new
    @province_form_presenter = ProvinceFormPresenter.new(view_context)
    @post = Post.new
    @post.build_contact
  end

  def create
    @post = Post.new(post_params.merge(pet: params[:pet], category_id: params[:category_id]))

    if @post.save
      flash[:notice] = 'Publicacion Creada!'
    else
      @post = Post.new
    end
    
    respond_with([@category, @post], pet: params[:pet])
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    if params[:all] 
      @posts = @category.posts.paginate :page => params[:page], :per_page => 2
    end  
  end

 
  private

  def post_params
    permitted_params.permit
  end

  def load_categories
    @categories = Category.all
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
end
