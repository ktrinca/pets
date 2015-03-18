class PostsController < BaseController
  before_filter :load_categories
  before_action :find_category

  def new
    @province_form_presenter = ProvinceFormPresenter.new(view_context)
    @post = @category.posts.build
    @post.build_contact
  end

  def create
    @post = Post.new(post_params.merge(pet: params[:pet]))

    if @post.save
      flash[:notice] = 'Publicacion Creada!'
    else
      @post = Post.new
    end
    
    respond_with([@category, @post])
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    if params[:pubs] 
      @posts = Post.where(pets: params[:pet])  
    end   
  end

  #def publications
     
  #end  

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
