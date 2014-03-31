require File.dirname(__FILE__) + '/../../test_helper'  
require 'admin/supplier_controller'

class Admin::SupplierController; def rescue_action(e) raise e end; end

class Admin::SupplierControllerTest < ActionController::TestCase
  fixtures :suppliers

  test "should get new" do
    get :new
    assert_template 'admin/supplier/new'
    assert_tag 'h1', :content => 'Crear nuevo proveedor'
    assert_tag 'form', :attributes => {:action => '/admin/supplier/create'}
    assert_response :success
  end

  test "should get create" do
    get :new
    assert_template 'admin/supplier/new'
    n = Supplier.count
    post :create, :supplier => {:name => 'Proveedor',
                                :city => 'Ciudad',
                                :street => 'Calle',
                                :phone => '123456789'}
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal n + 1, Supplier.count
    assert_equal 'El proveedor Proveedor ha sido creado.', flash[:notice]
  end

  test "should get edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input',
               :attributes => { :name => 'supplier[name]',
                                :value => 'proveedor1'
                              }
    assert_tag :tag => 'input',
               :attributes => { :name => 'supplier[city]',
                                :value => 'ciudad1'
                              }
    assert_tag :tag => 'input',
               :attributes => { :name => 'supplier[street]',
                                :value => 'calle1'
                              }
    assert_tag :tag => 'input',
               :attributes => { :name => 'supplier[phone]',
                                :value => '111222333'
                              } 
    assert_response :success
  end

  test "should get update" do
    post :update, :id => 1, :supplier => { :name => 'proveedor_modificado',
                                           :city => 'ciudad1',
                                           :street => 'calle1',
                                           :phone => '112233' 
                                         }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'proveedor_modificado', Supplier.find(1).name
  end

  test "should get destroy" do
    n = Supplier.count
    post :destroy, :id => 1
    assert_equal n - 1, Supplier.count
    assert_response :redirect
    assert_redirected_to :action => 'index'
    #follow_redirect!
    get :index
    assert_tag :tag => 'div', :attributes => { :id => 'notice' }, 
        :content => 'El proveedor proveedor1 ha sido borrado.'
  end

  test "should get show" do
    get :show, :id => 1
    assert_template 'admin/supplier/show'
    assert_equal 'proveedor1', assigns(:supplier).name
    assert_equal 'calle1', assigns(:supplier).street
    assert_equal 'ciudad1', assigns(:supplier).city
    assert_equal '111222333', assigns(:supplier).phone
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table',
               :children => { :count => Supplier.count + 1,
                              :only => { :tag => 'tr' }
                            }
    Supplier.all.each do |s|
        assert_tag :tag => 'a',
                   :content => s.name
    end
  end
end