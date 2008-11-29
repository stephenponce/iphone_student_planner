require 'test_helper'

class ReoccurrencesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:reoccurrences)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_reoccurrence
    assert_difference('Reoccurrence.count') do
      post :create, :reoccurrence => { }
    end

    assert_redirected_to reoccurrence_path(assigns(:reoccurrence))
  end

  def test_should_show_reoccurrence
    get :show, :id => reoccurrences(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => reoccurrences(:one).id
    assert_response :success
  end

  def test_should_update_reoccurrence
    put :update, :id => reoccurrences(:one).id, :reoccurrence => { }
    assert_redirected_to reoccurrence_path(assigns(:reoccurrence))
  end

  def test_should_destroy_reoccurrence
    assert_difference('Reoccurrence.count', -1) do
      delete :destroy, :id => reoccurrences(:one).id
    end

    assert_redirected_to reoccurrences_path
  end
end
