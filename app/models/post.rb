class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :contact
  has_many   :comments
  has_many   :post_images, dependent: :destroy, counter_cache: true
  
  scope :last_news, -> {where(category_id: 3).order(created_at: :desc) }
end
