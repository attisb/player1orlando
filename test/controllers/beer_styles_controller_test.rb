require 'test_helper'

class BeerStylesControllerTest < ActionController::TestCase
  setup do
    @beer_style = beer_styles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beer_styles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beer_style" do
    assert_difference('BeerStyle.count') do
      post :create, beer_style: { description: @beer_style.description, name: @beer_style.name }
    end

    assert_redirected_to beer_style_path(assigns(:beer_style))
  end

  test "should show beer_style" do
    get :show, id: @beer_style
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @beer_style
    assert_response :success
  end

  test "should update beer_style" do
    patch :update, id: @beer_style, beer_style: { description: @beer_style.description, name: @beer_style.name }
    assert_redirected_to beer_style_path(assigns(:beer_style))
  end

  test "should destroy beer_style" do
    assert_difference('BeerStyle.count', -1) do
      delete :destroy, id: @beer_style
    end

    assert_redirected_to beer_styles_path
  end
end
