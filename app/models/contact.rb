class Contact < ActiveRecord::Base
  has_many :posts
  validates :phone, :name,  presence: true

  def full_name
   self.last_name.nil? ? "#{self.name.capitalize}" : "#{self.name.capitalize} #{self.last_name.capitalize} "
  end	
end
