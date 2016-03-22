class SessionsController < ApplicationController
  skip_before_filter :set_current_user
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    respond_to do |format|
      if succesfully_login @user
        log_in @user
        params[:remember_me] == "1" ? remember(@user) : forget(@user)
        format.html { redirect_to @user, notice: "Bem vindo #{@user.username}." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
