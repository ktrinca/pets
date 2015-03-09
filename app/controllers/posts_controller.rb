class PostsController < BaseController
  def new
    @categories = Category.all
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
    @categories = Category.all
    @post = Post.find(params[:id])
  end  

  private

  def post_params
    permitted_params.permit
  end	
end
