class PostSearch < Searchlight::Search
  search_on Post.sorted

  searches :look_for, :status, :condition, :item_category

  def initialize(options = {})
    super
  end

  def search_look_for
    search.look_for(look_for)
  end

  def search_item_category
    search.item_category(item_category)
  end

  def search_status
    search.send(status.to_sym)
  end

  def search_condition
    search.send(condition.to_sym)
  end
end