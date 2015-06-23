class Contact < ActiveRecord::Base
  has_many :posts
  validates :phone, :name, :last_name,  presence: true
end
