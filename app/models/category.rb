class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  
  def adoption
    self.name == "Adopción"
  end	
end
