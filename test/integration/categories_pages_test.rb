require "test_helper"

class CategoriesPagesTest < ActionDispatch::IntegrationTest
  test "should list all available posts" do
    category =  create(:category, posts: [create(:post)])
    assert_equal '/categories/1', category_path(category)
  end
end
