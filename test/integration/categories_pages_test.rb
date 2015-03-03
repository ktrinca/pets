require "test_helper"

class CategoriesPagesTest < ActionDispatch::IntegrationTest
  before do
    category =  create(:category, posts: [create(:post)])
    visit category_path(category)  
  end	
  
  test "should list all available posts" do
    assert_response :success
  end
end
