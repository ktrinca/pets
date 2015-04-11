class PostParameters < ActionParameter::Base
  def permit
    params.require(:post).permit(:address, :body, :title, :pet,
    contact_attributes: [:city_id, :last_name, :name, :phone])
  end
end
