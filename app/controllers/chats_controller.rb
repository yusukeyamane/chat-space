class ChatsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?

  def index
    set_groups_and_chats
    @chat = Chat.new
  end

  def create
    user = User.find(current_user.id)
    chat = current_user.chats.new(chats_params)
    respond_to do |format|
      if chat.save
        format.html do
          redirect_to group_chats_path(params[:group_id]), notice: "メッセージが送信されました！！"
        end
        format.json do
          render json: chat, include: :user
        end
      else
        set_groups_and_chats
        render :index
      end
    end
  end

  private

  def json_request?
    request.format.json?
  end

  def set_groups_and_chats
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @chats = Chat.where(group_id: params[:group_id])
    @group_users = GroupUser.where(group_id: params[:group_id])
  end

  def chats_params
    params.require(:chat).permit(:body, :image, :group_id)
  end
end
