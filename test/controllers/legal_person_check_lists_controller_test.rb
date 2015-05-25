require 'test_helper'

class LegalPersonCheckListsControllerTest < ActionController::TestCase
  setup do
    @legal_person_check_list = legal_person_check_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:legal_person_check_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create legal_person_check_list" do
    assert_difference('LegalPersonCheckList.count') do
      post :create, legal_person_check_list: { annual_return: @legal_person_check_list.annual_return, business_finance_registration_boolean: @legal_person_check_list.business_finance_registration_boolean, business_rfc: @legal_person_check_list.business_rfc, business_statements: @legal_person_check_list.business_statements, charter: @legal_person_check_list.charter, financial_statements: @legal_person_check_list.financial_statements, personal_finance_registration: @legal_person_check_list.personal_finance_registration, personal_rfc: @legal_person_check_list.personal_rfc, personal_statements: @legal_person_check_list.personal_statements }
    end

    assert_redirected_to legal_person_check_list_path(assigns(:legal_person_check_list))
  end

  test "should show legal_person_check_list" do
    get :show, id: @legal_person_check_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @legal_person_check_list
    assert_response :success
  end

  test "should update legal_person_check_list" do
    patch :update, id: @legal_person_check_list, legal_person_check_list: { annual_return: @legal_person_check_list.annual_return, business_finance_registration_boolean: @legal_person_check_list.business_finance_registration_boolean, business_rfc: @legal_person_check_list.business_rfc, business_statements: @legal_person_check_list.business_statements, charter: @legal_person_check_list.charter, financial_statements: @legal_person_check_list.financial_statements, personal_finance_registration: @legal_person_check_list.personal_finance_registration, personal_rfc: @legal_person_check_list.personal_rfc, personal_statements: @legal_person_check_list.personal_statements }
    assert_redirected_to legal_person_check_list_path(assigns(:legal_person_check_list))
  end

  test "should destroy legal_person_check_list" do
    assert_difference('LegalPersonCheckList.count', -1) do
      delete :destroy, id: @legal_person_check_list
    end

    assert_redirected_to legal_person_check_lists_path
  end
end
