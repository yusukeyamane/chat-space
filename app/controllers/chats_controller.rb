class ChatsController < ApplicationController

  def index
    set_group_and_group_and_chats
    @users = GroupUser.where(group_id: params[:group_id])
    user = User.find(1)
    @chat = Chat.new
  end

  def create
    user = User.find(1)
    @chat = user.chats.new(chats_params)
    if @chat.save
      redirect_to group_chats_path(params[:group_id])
    else
      set_group_and_group_and_chats
      render :index
    end
  end

  private

  def set_group_and_group_and_chats
    @groups = Group.all
    @group = Group.find(params[:group_id])
    @chats = Chat.where(group_id: params[:group_id])
  end

  def chats_params
    params.require(:chat).permit(:body, :image, :group_id)
  end
end
