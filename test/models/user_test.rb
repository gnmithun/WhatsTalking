require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    
  end

  test 'username should not be blank' do
    @user = User.create( password:"Password")
    assert_not @user.valid?, 'Username is mandatory'
  end

  test 'user should be created successfully' do    
    @user = User.create(name:"Sam Dods", password:"Password")
    assert @user.valid?, 'User creation failed'
  end

  test 'two users with the same name should not be created' do 
    @user = User.create(name:"Sam Dods", password:"Password")
    user = User.create(name:"Sam Dods", password:"Password")
    assert_not user.valid?, 'User with name Sam Dods already exists'
  end

  test 'users should be associated with messages' do 
    newUser = User.create(name:"Wilkin Berry",password:"password")
    newMessage = Message.create(body:"Hello World", user:newUser)
    anotherMessage = Message.create(body:"Goodbye World", user:newUser)

    assert newUser.valid?, "New user should be created"
    assert newMessage.valid?, 'message object should be created successfully'
    assert anotherMessage.valid?, 'message object should be created successfully'       
    assert_equal newUser.messages.count,2, "Message not associated with user"
  end
  
end
