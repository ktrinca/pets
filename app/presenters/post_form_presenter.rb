class PostFormPresenter < BasePresenter
  def pets
    Post.pets.keys.map{ |t| t }
  end

  def statuses
    Post.statuses.keys.map{ |t| [ t.titleize, t.to_sym ] }
  end


end
