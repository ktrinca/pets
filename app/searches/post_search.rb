class PostSearch < Searchlight::Search
  search_on Post.sorted

  searches :look_for, :pet

  def initialize(options = {})
    super
  end

  def search_look_for
    search.look_for(look_for)
  end

  def search_pet
    search.send(pet.to_sym)
  end

end