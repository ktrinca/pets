class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :contact
  has_many   :comments

  scope :last_news, -> {where(category_id: 3).order(created_at: :desc) }
end
