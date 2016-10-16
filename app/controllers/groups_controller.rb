class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_chats_path(@group), notice: 'グループの作成に成功しました'
    else
      flash[:alert] = 'グループの作成に失敗しました'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end
