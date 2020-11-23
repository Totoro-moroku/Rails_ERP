require 'test_helper'

class ItusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ituser = itusers(:one)
  end

  test "should get index" do
    get itusers_url
    assert_response :success
  end

  test "should get new" do
    get new_ituser_url
    assert_response :success
  end

  test "should create ituser" do
    assert_difference('Ituser.count') do
      post itusers_url, params: { ituser: { birthday: @ituser.birthday, email: @ituser.email, name: @ituser.name, password: @ituser.password } }
    end

    assert_redirected_to ituser_url(Ituser.last)
  end

  test "should show ituser" do
    get ituser_url(@ituser)
    assert_response :success
  end

  test "should get edit" do
    get edit_ituser_url(@ituser)
    assert_response :success
  end

  test "should update ituser" do
    patch ituser_url(@ituser), params: { ituser: { birthday: @ituser.birthday, email: @ituser.email, name: @ituser.name, password: @ituser.password } }
    assert_redirected_to ituser_url(@ituser)
  end

  test "should destroy ituser" do
    assert_difference('Ituser.count', -1) do
      delete ituser_url(@ituser)
    end

    assert_redirected_to itusers_url
  end
end
