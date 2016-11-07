class UsersController < ApplicationController

  def index
    @users = User.where('name LIKE ?', "%#{params[:name]}%")

    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(update_params)
      redirect_to root_path
    else
      flash[:alert]
      render :edit
    end
  end

  private

  def update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
