require 'test_helper'

class ChatroomControllerTest < ActionDispatch::IntegrationTest

  def setup
  end

  test 'root route if not logged in should load login page' do 
    get root_path
    assert_redirected_to login_path    
  end

  test 'root route if logged in should load chatroom page' do 
    user = User.create(name:"Mithun",password:"password")
    post login_path, params: { session:{ name: user.name, password: user.password } }

    assert_response :redirect
    assert_redirected_to root_path
    
    follow_redirect!
    assert_match "Welcome Mithun !!!", response.body    
  end

  def teardown
  end
  
end
