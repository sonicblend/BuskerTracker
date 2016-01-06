# == Schema Information
#
# Table name: buskers
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  image_id    :string
#  facebook    :string
#  twitter     :string
#  website     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class BuskersControllerTest < ActionController::TestCase
  setup do
    @busker = buskers(:tom)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buskers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create busker" do
    assert_difference('Busker.count') do
      post :create, busker: { description: @busker.description, facebook: @busker.facebook, image_id: @busker.image_id, name: @busker.name, twitter: @busker.twitter, website: @busker.website }
    end

    assert_redirected_to busker_path(assigns(:busker))
  end

  test "should show busker" do
    get :show, id: @busker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @busker
    assert_response :success
  end

  test "should update busker" do
    patch :update, id: @busker, busker: { description: @busker.description, facebook: @busker.facebook, image_id: @busker.image_id, name: @busker.name, twitter: @busker.twitter, website: @busker.website }
    assert_redirected_to busker_path(assigns(:busker))
  end

  test "should destroy busker" do
    assert_difference('Busker.count', -1) do
      delete :destroy, id: @busker
    end

    assert_redirected_to buskers_path
  end
end
