require 'test_helper'

class TicksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ticks_index_url
    assert_response :success
  end

  test "should get new" do
    get ticks_new_url
    assert_response :success
  end

  test "should get create" do
    get ticks_create_url
    assert_response :success
  end

  test "should get show" do
    get ticks_show_url
    assert_response :success
  end

  test "should get edit" do
    get ticks_edit_url
    assert_response :success
  end

  test "should get delete" do
    get ticks_delete_url
    assert_response :success
  end

end
