class UsersController < ApplicationController
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
