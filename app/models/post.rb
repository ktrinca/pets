class Post < ActiveRecord::Base
  include PgSearch
  enum pet: %w(perros gatos otros)
  
  belongs_to :category
  belongs_to :user
  belongs_to :contact
  belongs_to :city
  has_many   :comments, :dependent => :destroy
  has_many   :post_images, dependent: :destroy, counter_cache: true

  accepts_nested_attributes_for :contact
  
  validates :title, :body, :presence => 'Complete por favor'
  
  
  scope :last_news, -> {where(category_id: 3).order(created_at: :desc) }
  
  self.per_page = 2
  
  # Instance methods
  def image
    @image = self.post_images.exists? ? 
             self.post_images.first.image.url : 'puppy.jpg'
  end
end
