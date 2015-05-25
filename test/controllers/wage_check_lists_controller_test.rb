require 'test_helper'

class WageCheckListsControllerTest < ActionController::TestCase
  setup do
    @wage_check_list = wage_check_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wage_check_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wage_check_list" do
    assert_difference('WageCheckList.count') do
      post :create, wage_check_list: { labor_letter: @wage_check_list.labor_letter, payroll_statements: @wage_check_list.payroll_statements, payslips: @wage_check_list.payslips }
    end

    assert_redirected_to wage_check_list_path(assigns(:wage_check_list))
  end

  test "should show wage_check_list" do
    get :show, id: @wage_check_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wage_check_list
    assert_response :success
  end

  test "should update wage_check_list" do
    patch :update, id: @wage_check_list, wage_check_list: { labor_letter: @wage_check_list.labor_letter, payroll_statements: @wage_check_list.payroll_statements, payslips: @wage_check_list.payslips }
    assert_redirected_to wage_check_list_path(assigns(:wage_check_list))
  end

  test "should destroy wage_check_list" do
    assert_difference('WageCheckList.count', -1) do
      delete :destroy, id: @wage_check_list
    end

    assert_redirected_to wage_check_lists_path
  end
end
