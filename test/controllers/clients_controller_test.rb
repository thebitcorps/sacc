require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { birthdate: @client.birthdate, curp: @client.curp, current_salesman_id: @client.current_salesman_id, first_name: @client.first_name, imss: @client.imss, income: @client.income, mail: @client.mail, maternal_name: @client.maternal_name, notes: @client.notes, paternal_name: @client.paternal_name, spouse: @client.spouse, workplace: @client.workplace }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { birthdate: @client.birthdate, curp: @client.curp, current_salesman_id: @client.current_salesman_id, first_name: @client.first_name, imss: @client.imss, income: @client.income, mail: @client.mail, maternal_name: @client.maternal_name, notes: @client.notes, paternal_name: @client.paternal_name, spouse: @client.spouse, workplace: @client.workplace }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
