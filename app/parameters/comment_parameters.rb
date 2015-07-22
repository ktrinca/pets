class CommentParameters < ActionParameter::Base
  def permit
    params.require(:comment).permit(:body, :parent_id, :post_id)
  end
end
