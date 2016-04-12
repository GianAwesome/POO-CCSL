class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_admin
  before_action :check_admin_count, only: [:destroy, :set_admin]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Usuario #{@user.username} criado com sucesso."
      redirect_to user_path @user
    else
      flash[:warning] = @user.errors.full_messages
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'Usuario atualizado com sucesso.'
      redirect_to user_path @user
    else
      flash[:warning] = @user.errors.full_messages
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.admin && User.where(admin: true).count == 1
      flash[:warning] = ["O sistema deve ter no minimo um administrador"]
    else
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "#{@user.username} deletado com sucesso."
    end
    redirect_to users_path
  end

  def set_admin
    if !(params[:admin].to_bool) && User.where(admin: true).count == 1
      flash[:warning] = ["O sistema deve ter no minimo um administrador"]
    else
      @user = User.find(params[:id])
      if @user.update_attribute(:admin, params[:admin])
        flash[:notice] = 'Usuario atualizado com sucesso.'
      else
        flash[:warning] = @user.errors.full_messages
      end
    end
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: params[:id])
      if(@user == nil)
        flash[:warning] = ["Este usuario nao existe"]
        redirect_to users_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def check_admin
      if !admin?
        flash[:notice] = "Voce nao possui direitos para acessar esse recurso"
        redirect_to events_path
      end
    end

    def check_admin_count
      
    end
end
