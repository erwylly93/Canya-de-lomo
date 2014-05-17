# encoding: utf-8
class UserController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
    @page_title = 'Crear nueva cuenta'
    if current_user
      flash[:notice] = 'Sólo se puede crear una cuenta.'
      redirect_to :controller => 'about', :action => 'index'
    else
      redirect_to :controller => 'user_session', :action => 'new' unless User.count == 0
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "La cuenta #{@user.name} ha sido creada. Sesión iniciada."
      redirect_to :action => 'show'
    else
      @page_title = 'Crear nueva cuenta'
      render :action => :new
    end
  end

  def edit
    @user = current_user
    @page_title = 'Editar cuenta'
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "La cuenta #{@user.name} ha sido actualizada."
      redirect_to :action => 'show'
    else
      @page_title = 'Editar cuenta'
      render :action => 'edit'
    end
  end

  def show
    @user = current_user
    @page_title = @user.name
  end
end
