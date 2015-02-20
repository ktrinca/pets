class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :contact
  has_many   :comments
end
