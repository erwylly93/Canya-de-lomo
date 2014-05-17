# encoding: utf-8
class UserSessionController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create, :forgot_password, :reset_password]

  def new
    @user_session = UserSession.new
    @page_title = 'Iniciar sesión'
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.remember_me = false
    if @user_session.save
      flash[:notice] = "Se ha iniciado la sesión con éxito."
      redirect_back_or_default :controller => '/admin/brand', :action => :index
    else
      flash[:notice] = "Login o contraseña incorrectos."
      render :action => :new
    end
  end

  def destroy
    if current_user_session
      current_user_session.destroy
      flash[:notice] = "Se ha cerrado la sesión con éxito."
    end  
    redirect_to :controller => :catalog, :action => :index
  end

  def forgot_password
    return unless request.post?
    if User.count == 0
      flash[:notice] = "No existe cuenta de administrador"
      redirect_to :controller => '/catalog'
    elsif @user = User.find_by_email(params[:email])
      @user.forgot_password
      @user.save
      flash[:notice] = "Se ha enviado un correo electrónico con las instrucciones para 
                        restablecer tu contraseña (#{params[:email]})"
      redirect_to :controller => '/catalog'
    else
      flash.now[:notice] = "No se ha encontrado ningún usuario con esa dirección de correo"
    end
  end

  # def reset_password
  #   @page_title = "Restablecer contraseña"
  #   @user = User.find_by_pw_reset_code(params[:id]) rescue nil
  #   unless @user
  #     render :text => "Not found", :status => 404
  #     return
  #   end
  #   return unless request.post?
  #   if @user.update_attributes(params[:user])
  #     @user.reset_password
  #     flash[:notice] = "La contraseña se ha restablecido."
  #     redirect_back_or_default :controller => '/about'
  #   end
  # end

  def reset_password
    @page_title = "Restablecer contraseña"
    if request.post?
      @user = User.find_by_id(session[:user_id])
      session[:user_id] = nil
      @user.attributes.each do |x|
        puts x
      end
      unless @user
        render :text => "Not found", :status => 404
        return
      end
      if @user.update_attributes(params[:user])
        @user.reset_password
        session[:user_id] = nil
        flash[:notice] = "La contraseña se ha restablecido."
        redirect_back_or_default :controller => '/about'
      end
    else
      if User.count == 0
        flash[:notice] = 'No existe cuenta de administrador'
        redirect_back_or_default :controller => '/about'
      else
        # tendría más sentido @user = User.find_by_pw_reset_code(params[:id])
        # y si params[:id] no existiese, devolviese nil, pero por alguna razón
        # devuelve el usuario...
        @user = params[:id] ? User.find_by_pw_reset_code(params[:id]) : nil
        if @user
          session[:user_id] = @user.id
        else
          flash[:notice] = 'No se hizo ninguna petición de restauración de contraseña'
          redirect_back_or_default :controller => '/about'
        end
      end
    end
  end
end
