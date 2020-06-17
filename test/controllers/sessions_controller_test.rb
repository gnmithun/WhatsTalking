require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

    test 'login screen should show up with login route' do 
      get login_path
      assert :success
    end

end
