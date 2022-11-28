class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def belong_to_group
    @user = User.find(params[:id])
    @group_members = GroupMember.where(user_id: @user.id)
  end

  def destroy
    @user = User.find(params[:id])
    redirect_to destroy_session_path(@user)
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
