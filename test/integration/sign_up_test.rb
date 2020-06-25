require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest

  test 'sign_up path should load sign_up page' do 
    get signup_path
    assert :success
    assert_select 'h2', "Signup for MessageMe - a complete ChatApp"
  end

  test 'signup should successfully create a new user' do 
    get signup_path
    assert :success

    post users_path, params: { user: { name: "Mithun", password: "password" } }

    assert_equal 1, User.all.count
    user = User.find_by(name:"Mithun")
    assert user
  end
end
