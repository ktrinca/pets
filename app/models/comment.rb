class Comment < ActiveRecord::Base
  before_destroy :delete_parents	
  belongs_to :user
  belongs_to :post
  acts_as_tree order: 'created_at DESC'
  
  scope :by_post, ->(post_id) { where(post_id: post_id) }
  
  private
    def delete_parents
      self.class.delete_all "parent_id = #{id}"
    end
end