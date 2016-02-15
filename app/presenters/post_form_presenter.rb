class PostFormPresenter < BasePresenter
  def pets
    Post.pets.keys.map{ |t| t }
  end

  def statuses
    Post.statuses.keys.map{ |t| [ t.titleize, t.to_sym ] }
  end

  def lost_state
    Post.statuses.keys[2..3].map{ |t| [ t.titleize, t.to_sym ] }
  end	


end
