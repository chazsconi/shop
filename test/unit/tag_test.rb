require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save tag without name" do
    tag = Tag.new
    assert !tag.save, "Saved the tag without a name"
  end
  
end
