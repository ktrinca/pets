class Post < ActiveRecord::Base
  include PgSearch
  enum pet: %w(perros gatos otros)
  enum status: %w(en_adopcion adoptado perdido reencuentro)
  
  belongs_to :category
  belongs_to :user
  belongs_to :contact
  belongs_to :city
  has_many   :comments, :dependent => :destroy
  has_many   :post_images, dependent: :destroy, counter_cache: true

  accepts_nested_attributes_for :contact
  
  validates :title, :body, :presence => 'Complete por favor'
  
  
  scope :last_news, -> {where(category_id: 3).order(created_at: :desc) }
  scope :sorted, -> { order(created_at: :desc) }
  scope :for_adoption, -> { where(status: 0) }
  scope :already_adopted, -> { where(status: 1) }
  scope :already_found, -> { where(status: 3) }
  scope :losts, -> { where(status: 2) }

  pg_search_scope :look_for,
    against: %w(title body category_id),
    using: {
      tsearch: {
        prefix: true } }

  self.per_page = 2
  
  # Instance methods
  def image
    @image = self.post_images.exists? ? 
             self.post_images.first.image.url : 'puppy.jpg'
  end

  
end