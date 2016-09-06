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
    @params_status = status_params_lost
    @params_status_adopcion= status_params_adoption
    @post_search = PostSearch.new(post_search_params)
    @posts = @post_search.results.where(category_id: params[:category_id]).page(params[:page] )
  end

  def edit
    @province_form_presenter = ProvinceFormPresenter.new(view_context)
    @post_form_presenter = PostFormPresenter.new(view_context)
    @post = Post.find(params[:id])
  end

  def destroy
    @comments = Comment.by_post(params[:id])
    @post     = Post.find(params[:id])
    status    = @post.status 
    @comments.destroy_all if !@comments.nil?
    flash[:notice] = 'La Pubicación fue eliminada!' if @post.destroy
    respond_with(@category, location: category_posts_url(status: status))
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
   (params[:post_search] || {}).merge(is_adoption: status_params_adoption, is_lost: status_params_lost)
  end
  
  def status_post
    if @category.adoption  
      @category.adoption &&  !@category.losts ? :en_adopcion : nil
    else
      @category.losts && !@category.adoption ? :perdido : nil
    end  
  end

  def status_params_adoption
    if @category.name == 'Adopción' && params[:status] == 'en_adopcion'
      true
    elsif @category.name == 'Adopción' && params[:status] == 'adoptado'
      false
    else
      'either'
    end      
  end


  def status_params_lost
    if @category.name == 'Perdidos' && params[:status] == 'perdido'
      true
    elsif @category.name == 'Perdidos' && params[:status] == 'reencuentro'
      false
    else
      'either'
    end      
  end
end
