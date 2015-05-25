require 'test_helper'

class NaturalPersonCheckListsControllerTest < ActionController::TestCase
  setup do
    @natural_person_check_list = natural_person_check_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:natural_person_check_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create natural_person_check_list" do
    assert_difference('NaturalPersonCheckList.count') do
      post :create, natural_person_check_list: { annual_return: @natural_person_check_list.annual_return, finance_registration: @natural_person_check_list.finance_registration, fiscal_statements: @natural_person_check_list.fiscal_statements, rfc: @natural_person_check_list.rfc }
    end

    assert_redirected_to natural_person_check_list_path(assigns(:natural_person_check_list))
  end

  test "should show natural_person_check_list" do
    get :show, id: @natural_person_check_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @natural_person_check_list
    assert_response :success
  end

  test "should update natural_person_check_list" do
    patch :update, id: @natural_person_check_list, natural_person_check_list: { annual_return: @natural_person_check_list.annual_return, finance_registration: @natural_person_check_list.finance_registration, fiscal_statements: @natural_person_check_list.fiscal_statements, rfc: @natural_person_check_list.rfc }
    assert_redirected_to natural_person_check_list_path(assigns(:natural_person_check_list))
  end

  test "should destroy natural_person_check_list" do
    assert_difference('NaturalPersonCheckList.count', -1) do
      delete :destroy, id: @natural_person_check_list
    end

    assert_redirected_to natural_person_check_lists_path
  end
end
