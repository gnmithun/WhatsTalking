require 'test_helper'

class MessagesTest < ActiveSupport::TestCase
  def setup
    
  end

  test 'messages should be created' do 
    newUser = User.create(name:"Wilkin Berry",password:"password")
    message = Message.create(body:"Hello World",user:newUser)              
    assert message.valid?, 'message object should be created successfully'
  end

  test 'messages should be associated with Users' do 
    newUser = User.create(name:"Wilkin Berry",password:"password")
    newMessage = Message.create(body:"Hello World", user:newUser)
    anotherMessage = Message.create(body:"Goodbye World", user:newUser)

    assert newUser.valid?, "New user should be created"
    assert newMessage.valid?, 'message object should be created successfully'
    assert anotherMessage.valid?, 'message object should be created successfully'       
    assert_equal newUser.messages.count,2, "Message not associated with user"
  end

  def teardown
    
  end

end
