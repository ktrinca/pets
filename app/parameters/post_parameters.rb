class PostParameters < ActionParameter::Base
  def permit
    params.require(:post).permit(:city_id, :address, :body, :title, :pet,
    contact_attributes: [:last_name, :name, :phone])
  end
end
