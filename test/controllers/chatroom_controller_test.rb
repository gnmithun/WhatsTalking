require 'test_helper'

class ChatroomControllerTest < ActionDispatch::IntegrationTest

  def setup
  end

  test 'root route should load chatroom' do 
    get root_path
    assert :success
  end

  def teardown
  end
  
end
