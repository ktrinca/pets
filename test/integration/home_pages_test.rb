require "test_helper"

class HomePagesTest < ActionDispatch::IntegrationTest
  before do
    category =  FactoryGirl.create(:category)
  end	
  
  test "listing all categories" do
    visit root_path
    categories = Category.all 
    assert_equal 'Denuncias', categories.first.name
  end

end
