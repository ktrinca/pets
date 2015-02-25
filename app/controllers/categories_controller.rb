class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def new
    @cartegory = Category.new
  end	
end
