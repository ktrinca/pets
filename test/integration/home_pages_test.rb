require "test_helper"

class HomePagesTest < ActionDispatch::IntegrationTest
  category =  FactoryGirl.create(:category)
  
  test "listing all categories" do
    visit root_path
    categories = Category.all 
    assert_equal 'Adopción', categories.first.name
  end

end
