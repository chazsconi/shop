require 'test_helper'

class VariantOptionTypesControllerTest < ActionController::TestCase
  setup do
    @variant_option_type = variant_option_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:variant_option_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create variant_option_type" do
    assert_difference('VariantOptionType.count') do
      post :create, variant_option_type: { description: @variant_option_type.description, display_name: @variant_option_type.display_name, name: @variant_option_type.name }
    end

    assert_redirected_to variant_option_type_path(assigns(:variant_option_type))
  end

  test "should show variant_option_type" do
    get :show, id: @variant_option_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @variant_option_type
    assert_response :success
  end

  test "should update variant_option_type" do
    put :update, id: @variant_option_type, variant_option_type: { description: @variant_option_type.description, display_name: @variant_option_type.display_name, name: @variant_option_type.name }
    assert_redirected_to variant_option_type_path(assigns(:variant_option_type))
  end

  test "should destroy variant_option_type" do
    assert_difference('VariantOptionType.count', -1) do
      delete :destroy, id: @variant_option_type
    end

    assert_redirected_to variant_option_types_path
  end
end
