class UsersController < ApplicationController
  def show
    @user  = User.find(params[:id])
    if (@user.id == current_user.id)
    {

    }
    end
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  def profile

  end


  private

  def user_params
    params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender, :avatar)
  end
end
