require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest

  test 'sign_up path should load sign_up page' do 
    get signup_path
    assert :success
    assert_select 'h1', "Welcome to Sign Up Page"
  end

end
