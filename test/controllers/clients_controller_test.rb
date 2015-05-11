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
      post :create, client: { birthdate: @client.birthdate, curp: @client.curp, current_salesman_id: @client.current_salesman_id, name: @client.name, imss: @client.imss, income: @client.income, mail: @client.mail, maternal_lastname: @client.maternal_lastname, notes: @client.notes, paternal_lastname: @client.paternal_lastname, spouse: @client.spouse, workplace: @client.workplace }
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
    patch :update, id: @client, client: { birthdate: @client.birthdate, curp: @client.curp, current_salesman_id: @client.current_salesman_id, name: @client.name, imss: @client.imss, income: @client.income, mail: @client.mail, maternal_lastname: @client.maternal_lastname, notes: @client.notes, paternal_lastname: @client.paternal_lastname, spouse: @client.spouse, workplace: @client.workplace }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
