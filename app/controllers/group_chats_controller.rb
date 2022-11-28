class GroupChatsController < ApplicationController

  def new
    @group_chat = GroupChat.new
  end

  def create
    @group_chat = GroupChat.new(group_chat_params)
    @group_chat.user_id = current_user.id
    @group = Group.find(@group_chat.group_id)
    if @group_chat.save
      redirect_to chat_room_path(@group.id), notice: '送信しました。'
    else
      redirect_to chat_room_path(@group.id),notice: '送信に失敗しました。'
    end
  end

  def destroy
    @group_chat = GroupChat.find(params[:id])
    @group = Group.find(@group_chat.group_id)
    @group_chat.destroy
    redirect_to chat_room_path(@group.id)
  end

  private

  def group_chat_params
    params.require(:group_chat).permit(:group_id, :user_id, :chat)
  end
end
