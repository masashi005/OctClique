class GroupMembersController < ApplicationController



  def index

  end

  def show

  end

  def new
    @group_member = GroupMember.new
  end

  def create
    @group_member = GroupMember.new(group_member_params)
    @group_member.user_id = current_user.id
    if @group_member.save
      redirect_to group_path(@group_member.group_id), notice: 'グループに参加しました。'
    else
      redirect_to root_path
    end
  end

  def destroy
    @group_member = GroupMember.find(params[:id])
    @group = Group.find(@group_member.group_id)
    if @group_member.destroy
      redirect_to group_path(@group.id), notice: 'グループを脱退しました。'
    else

    end
  end

  private

  def group_member_params
    params.require(:group_member).permit(:group_id, :user_id)
  end


end