require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "email validation should trigger" do
    assert_not User.new(name: "David Polynar").save
  end

  test "user should save" do
    assert User.new(email: "asda@asasdd.com", encrypted_password: "asd").save
  end

end
