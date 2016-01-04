require 'test_helper'

class PerformancesControllerTest < ActionController::TestCase
  setup do
    @performance = performances(:first)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performance" do
    assert_difference('Performance.count') do
      post :create, performance: { amplified: @performance.amplified, busker_id: @performance.busker_id, end_date: @performance.end_date, start_date: @performance.start_date }
    end

    assert_redirected_to performance_path(assigns(:performance))
  end

  test "should show performance" do
    get :show, id: @performance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performance
    assert_response :success
  end

  test "should update performance" do
    patch :update, id: @performance, performance: { amplified: @performance.amplified, busker_id: @performance.busker_id, end_date: @performance.end_date, start_date: @performance.start_date }
    assert_redirected_to performance_path(assigns(:performance))
  end

  test "should destroy performance" do
    assert_difference('Performance.count', -1) do
      delete :destroy, id: @performance
    end

    assert_redirected_to performances_path
  end
end
