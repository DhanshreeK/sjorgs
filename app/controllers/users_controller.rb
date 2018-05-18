class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:user] = t('user_create')
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  

  def show
    @user = User.find(params[:id])
    @employee = User.where(role: 'Employee').take
  end
  
  def edit
    @user = User.find(params[:id])
  end
  

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = t('user_update')
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  def change_password
    @user = User.find(params[:id]) 
  end
  

  def update_password
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = t('pass_change')
      redirect_to user_path(@user)
    else
      render 'change_password'
    end
  end
   

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:user_delete] = t('user_delete')
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
