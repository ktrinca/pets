class CategoriesController < ApplicationController
  before_filter :load_categories
  def index
    @categories = Category.all
  end
  
  def new
    @cartegory = Category.new
  end

  def show
    @category   = Category.find(params[:id])
    @posts      = @category.posts
    name_category = ActiveSupport::Inflector.transliterate("#{@category.name}")
  end

  def load_categories
   @categories = Category.all
  end	
end
