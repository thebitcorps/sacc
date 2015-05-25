require 'test_helper'

class EmpresarialCheckListsControllerTest < ActionController::TestCase
  setup do
    @empresarial_check_list = empresarial_check_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empresarial_check_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empresarial_check_list" do
    assert_difference('EmpresarialCheckList.count') do
      post :create, empresarial_check_list: { annual_return: @empresarial_check_list.annual_return, finance_registration: @empresarial_check_list.finance_registration, fiscal_statements: @empresarial_check_list.fiscal_statements, rfc: @empresarial_check_list.rfc }
    end

    assert_redirected_to empresarial_check_list_path(assigns(:empresarial_check_list))
  end

  test "should show empresarial_check_list" do
    get :show, id: @empresarial_check_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empresarial_check_list
    assert_response :success
  end

  test "should update empresarial_check_list" do
    patch :update, id: @empresarial_check_list, empresarial_check_list: { annual_return: @empresarial_check_list.annual_return, finance_registration: @empresarial_check_list.finance_registration, fiscal_statements: @empresarial_check_list.fiscal_statements, rfc: @empresarial_check_list.rfc }
    assert_redirected_to empresarial_check_list_path(assigns(:empresarial_check_list))
  end

  test "should destroy empresarial_check_list" do
    assert_difference('EmpresarialCheckList.count', -1) do
      delete :destroy, id: @empresarial_check_list
    end

    assert_redirected_to empresarial_check_lists_path
  end
end
