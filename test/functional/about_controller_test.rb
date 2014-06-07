# encoding: utf-8
require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template 'about/index'
    assert_equal 'Sobre Caña de Lomo', assigns(:page_title)
    assert_tag 'title', :content => 'Sobre Caña de Lomo'
  end

end
