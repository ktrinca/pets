class CommentsController < BaseController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def new
    @comment = Comment.new
    @post    = Post.find(params[:post_id])
    @category =  Category.find(params[:category_id])
  end

  def create
    @post    = Post.find(params[:post_id])
    @category =  Category.find(params[:category_id])
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params.merge(user_id: current_user.id, post_id: params[:post_id] ))
    else

      @comment = Comment.new(comment_params.merge(user_id: current_user.id, post_id: params[:post_id]))
    
    end  
    if @comment.save
      flash[:success] = 'Su comentario fue agregado!'
      respond_with([@category, @post])
    else
      render 'new'
    end
  end
  
  private

  def comment_params
    permitted_params.permit
  end
end
