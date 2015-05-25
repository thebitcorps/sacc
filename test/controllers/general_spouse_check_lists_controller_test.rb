require 'test_helper'

class GeneralSpouseCheckListsControllerTest < ActionController::TestCase
  setup do
    @general_spouse_check_list = general_spouse_check_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:general_spouse_check_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create general_spouse_check_list" do
    assert_difference('GeneralSpouseCheckList.count') do
      post :create, general_spouse_check_list: { birth_certificate: @general_spouse_check_list.birth_certificate, ife: @general_spouse_check_list.ife, marriage_certificate: @general_spouse_check_list.marriage_certificate }
    end

    assert_redirected_to general_spouse_check_list_path(assigns(:general_spouse_check_list))
  end

  test "should show general_spouse_check_list" do
    get :show, id: @general_spouse_check_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @general_spouse_check_list
    assert_response :success
  end

  test "should update general_spouse_check_list" do
    patch :update, id: @general_spouse_check_list, general_spouse_check_list: { birth_certificate: @general_spouse_check_list.birth_certificate, ife: @general_spouse_check_list.ife, marriage_certificate: @general_spouse_check_list.marriage_certificate }
    assert_redirected_to general_spouse_check_list_path(assigns(:general_spouse_check_list))
  end

  test "should destroy general_spouse_check_list" do
    assert_difference('GeneralSpouseCheckList.count', -1) do
      delete :destroy, id: @general_spouse_check_list
    end

    assert_redirected_to general_spouse_check_lists_path
  end
end
