class PostsController < BaseController
  before_filter :load_categories
  before_action :find_category
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  
  def new
    @province_form_presenter = ProvinceFormPresenter.new(view_context)
    @post_form_presenter = PostFormPresenter.new(view_context)
    @post = Post.new
    @post.build_contact
  end

  def create
    @post = Post.new(post_params.merge(category_id: params[:category_id], 
                     user_id: current_user.id, status: status_post))
    
    if @post.save
      flash[:notice] = 'Publicacion Creada!'
    else
      @post = Post.new
    end
    
    respond_with([@category, @post])
  end

  def show
    @post     = Post.find_by_id_and_category_id(params[:id], params[:category_id])
    @comments = Comment.by_post(params[:id]).hash_tree
    @comment  = Comment.new
  end

  def index
    @post_form_presenter = PostFormPresenter.new(view_context)
    @params_status = status_params
    @post_search = PostSearch.new(post_search_params)
    @posts = @post_search.results.where(category_id: params[:category_id]).page(params[:page] )
  end

  def edit
    @province_form_presenter = ProvinceFormPresenter.new(view_context)
    @post_form_presenter = PostFormPresenter.new(view_context)
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params.merge(status: params[:post][:status]))
      flash[:notice] = 'Publicacion Actualizada!'
    else
      @post = Post.new
    end
    
    respond_with([@category, @post])
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

  def post_search_params
   (params[:post_search] || {}).merge(is_adoption: status_params)
  end
  
  def status_post
    @category.adoption ? :en_adopcion : nil
  end

  def status_params
    if @category.name == 'Adopción' && params[:status] == 'true'
      true
    elsif @category.name == 'Adopción' && params[:status] == 'false'
      false
    else
      'either'
    end      
  end  
end
