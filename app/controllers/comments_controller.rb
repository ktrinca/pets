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

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|

      if @comment.update_attributes(body: params[:body])
        
        format.json { head :no_content }
      else
      end 
    end 
  end

  def destroy
    comment = Comment.find(params[:id])
    @post    = Post.find(params[:post_id])
    @category =  Category.find(params[:category_id])
    
    flash[:notice] = 'Item was deleted!' if comment.destroy

    respond_with([@category, @post])
  end
  
  private

  def comment_params
    permitted_params.permit
  end
end
