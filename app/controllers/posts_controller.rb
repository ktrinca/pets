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
    @post = Post.new(post_params.merge(category_id: params[:category_id], user_id: current_user.id, status: :en_adopcion))
    
    if @post.save
      flash[:notice] = 'Publicacion Creada!'
    else
      @post = Post.new
    end
    
    respond_with([@category, @post])
  end

  def show
    @post     = Post.find(params[:id])
    @comments = Comment.by_post(params[:id]).hash_tree
    @comment  = Comment.new
  end

  def index
    @post_form_presenter = PostFormPresenter.new(view_context)
    @post_search = PostSearch.new(post_search_params[:post_search])
    @posts = @post_search.results.page(params[:page])
  end

  def edit
    @province_form_presenter = ProvinceFormPresenter.new(view_context)
    @post_form_presenter = PostFormPresenter.new(view_context)
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
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
    params.permit(post_search: [:look_for, :pet, :utf_8, :category_id])
  end
    
end
