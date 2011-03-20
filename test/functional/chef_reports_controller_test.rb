require 'test_helper'

class ChefReportsControllerTest < ActionController::TestCase
  setup do
    @chef_report = chef_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chef_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chef_report" do
    assert_difference('ChefReport.count') do
      post :create, :chef_report => @chef_report.attributes
    end

    assert_redirected_to chef_report_path(assigns(:chef_report))
  end

  test "should show chef_report" do
    get :show, :id => @chef_report.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @chef_report.to_param
    assert_response :success
  end

  test "should update chef_report" do
    put :update, :id => @chef_report.to_param, :chef_report => @chef_report.attributes
    assert_redirected_to chef_report_path(assigns(:chef_report))
  end

  test "should destroy chef_report" do
    assert_difference('ChefReport.count', -1) do
      delete :destroy, :id => @chef_report.to_param
    end

    assert_redirected_to chef_reports_path
  end
end
