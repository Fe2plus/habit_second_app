require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:hogehoge)
    @post = Post.new(habit: "hello world foo bar", user_id: @user.id)
  end

  test "post should be valid" do
    assert @post.valid?
  end

end
