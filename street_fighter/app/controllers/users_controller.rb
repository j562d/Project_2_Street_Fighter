class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
 #   @combo = Combo.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully registered!"
      redirect_to root_path
    else
      render 'new'
    end
  end




  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
