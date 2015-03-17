class Post < ActiveRecord::Base
  include PgSearch
  enum pet: %w(perros gatos otros)

  belongs_to :category
  belongs_to :contact
  has_many   :comments
  has_many   :post_images, dependent: :destroy, counter_cache: true

  accepts_nested_attributes_for :contact
  validates :title, :body, :presence => 'Complete por favor'
  
  scope :last_news, -> {where(category_id: 3).order(created_at: :desc) }
end
