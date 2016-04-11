class PostSearch < Searchlight::Search
  search_on Post.sorted

  searches :look_for, :pet, :category_id, :is_adoption, :is_lost

  def initialize(options = {})
    super
    #self.is_adoption = :either if is_adoption.blank?
  end

  def search_look_for
    search.look_for(look_for)
  end

  def search_pet
    search.send(pet.to_sym)
  end

  def search_is_adoption 
    case is_adoption.to_s
    when 'true' then search.where(status: 0)
    when 'false' then search.where(status: 1)
    when 'either' then search # unmodified
    end
  end

  def search_is_lost 
    case is_lost.to_s
    when 'true' then search.where(status: 2)
    when 'false' then search.where(status: 3)
    when 'either' then search # unmodified
    end
  end  
end