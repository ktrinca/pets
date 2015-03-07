class PostImage < ActiveRecord::Base
  belongs_to :post

  mount_uploader :image, ImageUploader
  validates :image, presence: true
  scope :sorted, -> { order(position: :asc) }

  before_create :default_position

  protected

  def default_position
    self.position = item.item_images.count + 1
  end
end
