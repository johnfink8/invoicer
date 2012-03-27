require 'test_helper'

class LineDescriptionsControllerTest < ActionController::TestCase
  setup do
    @line_description = line_descriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_description" do
    assert_difference('LineDescription.count') do
      post :create, :line_description => @line_description.attributes
    end

    assert_redirected_to line_description_path(assigns(:line_description))
  end

  test "should show line_description" do
    get :show, :id => @line_description
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @line_description
    assert_response :success
  end

  test "should update line_description" do
    put :update, :id => @line_description, :line_description => @line_description.attributes
    assert_redirected_to line_description_path(assigns(:line_description))
  end

  test "should destroy line_description" do
    assert_difference('LineDescription.count', -1) do
      delete :destroy, :id => @line_description
    end

    assert_redirected_to line_descriptions_path
  end
end
