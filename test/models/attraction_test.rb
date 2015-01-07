require 'test_helper'

class AttractionTest < ActiveSupport::TestCase
  fixtures :attractions, :users

  test "should be invalid" do
    attraction = create({name: nil, midia: nil, display_date: nil, user_id: nil})
    assert_not attraction.valid?, "Attraction shouldn't be created"
  end

  test "should be require name" do
    attraction = create(:name => nil, :midia => 'TV', :display_date => Time.zone.now, :user_id => 1)
    assert attraction.invalid?, ":name should be required"
    assert_not attraction.valid?, "Attraction shouldn't be created"
  end

  test "should require midia" do
    attraction = Attraction.create(:name => 'Supernatural', :midia => nil, :display_date => Time.zone.now, :user_id => 1)
    assert attraction.invalid?, ":midia should be required"
    assert_not attraction.valid?, "Attraction shouldn't be created"
  end

  test "should require user" do
    attraction = Attraction.create(:name => 'Supernatural', :midia => 'TV', :display_date => Time.zone.now, :user_id => nil)
    assert attraction.invalid?, ":user_id should be required"
    assert_not attraction.valid?, "Attraction shouldn't be created"
  end

  private
    def create(options={})
      Attraction.create({name: 'Supernatural',
        midia: 'TV',
        display_date: Time.zone.now,
        user_id: 1}.merge(options))
    end
end
