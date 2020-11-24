require 'test_helper'

class SublistTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sublist_type = sublist_types(:one)
  end

  test "should get index" do
    get sublist_types_url
    assert_response :success
  end

  test "should get new" do
    get new_sublist_type_url
    assert_response :success
  end

  test "should create sublist_type" do
    assert_difference('SublistType.count') do
      post sublist_types_url, params: { sublist_type: { name: @sublist_type.name } }
    end

    assert_redirected_to sublist_type_url(SublistType.last)
  end

  test "should show sublist_type" do
    get sublist_type_url(@sublist_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_sublist_type_url(@sublist_type)
    assert_response :success
  end

  test "should update sublist_type" do
    patch sublist_type_url(@sublist_type), params: { sublist_type: { name: @sublist_type.name } }
    assert_redirected_to sublist_type_url(@sublist_type)
  end

  test "should destroy sublist_type" do
    assert_difference('SublistType.count', -1) do
      delete sublist_type_url(@sublist_type)
    end

    assert_redirected_to sublist_types_url
  end
end
