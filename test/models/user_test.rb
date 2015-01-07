require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should be invalid" do
    user = User.create(name: nil, email: nil)
    assert_not user.valid?, "User shouldn't be created"
  end

  test "should be require name" do
    user = create(name: nil)
    assert user.invalid?, ":name should be required"
    assert_not user.valid?, "User shouldn't be created"
  end

  test "should require email" do
    user = create(email: nil)
    assert user.invalid?, ":email should be required"
    assert_not user.valid?, "User shouldn't be created"
  end

  test "should deny bad email" do
    user = create(email: 'bad@format')
    assert user.invalid?, ":email should be in a valid format"
    assert_not user.valid?, "User shouldn't be created"
  end

  test "should deny duplicate user" do
    user = create(name: 'Alberto Costa', email: 'alberto_costa@gmail.com')
    assert user.valid?, "User should be valid"

    user = create
    assert_not user.valid?, "User shouldn't be created"
  end

  private
    def create(option = {})
      User.create({name: 'Alberto Costa',
        email: 'alberto_costa@gmail.com'
        }.merge(option))
    end
end
