class SessionsController < ApplicationController
  skip_before_filter :set_current_user
 # vVPtje7
  def new
    redirect_to user_path current_user if logged_in?
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if succesfully_login user
      log_in user
      params[:remember_me] == "1" ? remember(user) : forget(user)
      flash[:notice] = "Bem vindo #{user.username}."
      redirect_to events_path
    else
      flash[:warning] = ['Username ou senha invalidos']
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

  def succesfully_login user
    return (user and user.authenticate(params[:session][:password]))
  end
end
