require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Users with all info provided are valid" do
    assert users(:hyab).valid?
  end

  test "Users with missing e-mail are invalid" do
     hnu = User.create(
      name: "Hyab Hnu",
      uid: 88888,
      provider: "github")
     User.create
    assert_not hnu.valid?
  end

  test "Users with missing uid are invalid" do
     hnu = User.create(
      name: "Hyab Hnu",
      email: "hnu@gmail.com",
      provider: "github")
     User.create
    assert_not hnu.valid?
  end
  test "Users with missing provider are invalid" do
     hnu = User.create(
      name: "Hyab Hnu",
      email: "hnu@gmail.com",
      uid: 88888,)
     User.create
    assert_not hnu.valid?
  end
  test "Users with missing name are valid" do
     hnu = User.create(
      email: "hnu@gmail.com",
      uid: 88888,
      provider: "github")
     User.create
    assert hnu.valid?
  end
end
