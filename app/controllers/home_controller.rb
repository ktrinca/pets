class HomeController < ApplicationController
  respond_to :html
  
  def index
    @categories = Category.order(:name)
  end  
  
end

