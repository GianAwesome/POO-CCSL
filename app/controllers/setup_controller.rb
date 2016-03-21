class SetupController < ApplicationController

  # before_filter :check_config, :only => 'index'
  skip_before_filter :set_current_user
  skip_before_filter :first_run
  def index
    return if not request.post?

    @user = User.new(username: params[:setting][:username], admin: true)
    @user.password = generate_password
    unless @user.valid?
      redirect_to :action => 'index'
      return
    end

    session[:tmppass] = @user.password

    return unless @user.save
    log_in @user

    redirect_to :action => 'confirm'
  end

  private
    def generate_password
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
      newpass = ""
      1.upto(7) { |i| newpass << chars[rand(chars.size-1)] }
      return newpass
    end

    def check_config
      return unless User.count == 0
      redirect_to users_path
    end
end