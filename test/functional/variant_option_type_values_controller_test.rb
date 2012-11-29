require 'test_helper'

class VariantOptionTypeValuesControllerTest < ActionController::TestCase
  setup do
    @variant_option_type_value = variant_option_type_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:variant_option_type_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create variant_option_type_value" do
    assert_difference('VariantOptionTypeValue.count') do
      post :create, variant_option_type_value: { description: @variant_option_type_value.description, name: @variant_option_type_value.name }
    end

    assert_redirected_to variant_option_type_value_path(assigns(:variant_option_type_value))
  end

  test "should show variant_option_type_value" do
    get :show, id: @variant_option_type_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @variant_option_type_value
    assert_response :success
  end

  test "should update variant_option_type_value" do
    put :update, id: @variant_option_type_value, variant_option_type_value: { description: @variant_option_type_value.description, name: @variant_option_type_value.name }
    assert_redirected_to variant_option_type_value_path(assigns(:variant_option_type_value))
  end

  test "should destroy variant_option_type_value" do
    assert_difference('VariantOptionTypeValue.count', -1) do
      delete :destroy, id: @variant_option_type_value
    end

    assert_redirected_to variant_option_type_values_path
  end
end
