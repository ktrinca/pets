class PostSearch < Searchlight::Search
  search_on Post.sorted

  searches :look_for, :pet, :category_id

  def initialize(options = {})
    self.category_id = category_id
    super
    
  end

  def search_look_for
    search.look_for(look_for)
  end

  def search_pet
    search.send(pet.to_sym)
  end

  
end