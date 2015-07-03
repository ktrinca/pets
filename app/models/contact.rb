class Contact < ActiveRecord::Base
  has_many :posts
  validates :phone, :name, :last_name,  presence: true

  def full_name
   "#{self.name.capitalize} #{self.last_name.capitalize} "
  end	
end
