class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  
  def adoption
    self.name == "Adopción"
  end

  def name_as_folder
    ActiveSupport::Inflector.transliterate("#{self.name}").downcase
  end	
end
