require "test_helper"

class CategoriesPagesTest < ActionDispatch::IntegrationTest
  before do
    category =  create(:category, posts: [create(:post)])
  end	
  
  def test_sanity
    flunk "Need real tests"
  end
end
