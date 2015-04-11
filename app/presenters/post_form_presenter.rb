class PostFormPresenter < BasePresenter
  def pets
    Post.pets.keys.map{ |t| t }
  end
end
