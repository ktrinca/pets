class CommentParameters < ActionParameter::Base
  def permit
    params.require(:comment).permit(:title, :body, :parent_id, :post_id)
  end
end
