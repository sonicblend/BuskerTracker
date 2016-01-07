require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "browse the site without logging in" do
    get '/'
    assert_response :success
    get '/buskers'
    assert_response :success
    get '/performances'
    assert_response :success
    get '/performances/new'
    assert_response :success
    get '/locations'
    assert_response :success
    get '/users/sign_up'
    assert_response :success
    get '/users/sign_in'
    assert_response :success

    get '/buskers/new'
    assert_response :redirect
    get '/locations/new'
    assert_response :redirect
  end
end
