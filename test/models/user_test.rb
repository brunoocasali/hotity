require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
   assert true
  end

  test "should be invalid" do
    user = User.create
    assert_not user.valid?, "User shouldn't be created"
  end

  test "should be require name" do
    user = User.create(:name => nil, :email => 'joridoss@gmail.com')
    assert user.invalid?, ":name should be required"
    assert_not user.valid?, "User shouldn't be created"
  end

  test "should require email" do
    user = User.create(:name => 'Jonatan Santos', :email => nil)
    assert user.invalid?, ":email should be required"
    assert_not user.valid?, "User shouldn't be created"
  end

  test "should deny bad email" do
    user = User.create(:name => 'Jonatan Santos', :email => 'bad@format')
    assert user.invalid?, ":email should be in a valid format"
    assert_not user.valid?, "User shouldn't be created"
  end

  test "should deny duplicate user" do
    user = User.create(:name => 'Jonatan Santos', :email => 'joridoss@gmail.com')
    assert user.valid?

    user = User.create(:name => 'Jonatan Santos', :email => 'joridoss@gmail.com')
    assert_not user.valid?, "User shouldn't be created"
  end
end
