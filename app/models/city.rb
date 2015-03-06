class City < ActiveRecord::Base
  has_many :contacts
  belongs_to :province, foreign_key: 'province_id'
  
  scope :sorted, -> { order(name: :asc) }
end