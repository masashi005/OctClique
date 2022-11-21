class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to root_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :explain, :leader_id)
  end

end