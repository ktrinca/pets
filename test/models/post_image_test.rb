require "test_helper"

class PostImageTest < ActiveSupport::TestCase

  def post_image
    @post_image ||= PostImage.new
  end

  def test_valid
    assert post_image.valid?
  end

end
