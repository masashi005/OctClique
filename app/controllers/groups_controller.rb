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
      redirect_to groups_path, notice: 'グループを作成しました。'
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @group_member = GroupMember.new
    @group_members = GroupMember.where(group_id: @group.id)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
        redirect_to groups_path, notice: 'グループを更新しました。'
    else
        render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to root_path, notice: 'グループを削除しました。'
    end
  end

  def chat
    @group = Group.find(params[:id])
    @group_chats = GroupChat.where(group_id: @group.id)
    @group_chat = GroupChat.new
  end

  private

  def group_params
    params.require(:group).permit(:name, :explain, :leader_id)
  end

end
