require 'test_helper'

class DisplayMessagesInChatroomTest < ActionDispatch::IntegrationTest
  test 'logged in users should be able to send messages' do

    user = User.create(name:"Mithun",password:"password")
    post login_path, params: { session:{ name: user.name, password: user.password } }

    assert_response :redirect
    assert_redirected_to root_path
  
    assert_equal current_user,user

    post create_path, params: { message: {body: "Hello World"} }    
    assert :success

    post create_path, params: { message: {body: "This is Danny from Tesco"} }    
    assert :success

    assert_equal 2,current_user.messages.count
    
  end
end
