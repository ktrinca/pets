class Province < ActiveRecord::Base
  has_many :cities

  scope :sorted, -> {order(name: :asc) }
end
