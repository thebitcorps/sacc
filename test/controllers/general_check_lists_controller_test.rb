require 'test_helper'

class GeneralCheckListsControllerTest < ActionController::TestCase
  setup do
    @general_check_list = general_check_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:general_check_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create general_check_list" do
    assert_difference('GeneralCheckList.count') do
      post :create, general_check_list: { address_proof: @general_check_list.address_proof, bank_request: @general_check_list.bank_request, birth_certificate: @general_check_list.birth_certificate, ife: @general_check_list.ife }
    end

    assert_redirected_to general_check_list_path(assigns(:general_check_list))
  end

  test "should show general_check_list" do
    get :show, id: @general_check_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @general_check_list
    assert_response :success
  end

  test "should update general_check_list" do
    patch :update, id: @general_check_list, general_check_list: { address_proof: @general_check_list.address_proof, bank_request: @general_check_list.bank_request, birth_certificate: @general_check_list.birth_certificate, ife: @general_check_list.ife }
    assert_redirected_to general_check_list_path(assigns(:general_check_list))
  end

  test "should destroy general_check_list" do
    assert_difference('GeneralCheckList.count', -1) do
      delete :destroy, id: @general_check_list
    end

    assert_redirected_to general_check_lists_path
  end
end
