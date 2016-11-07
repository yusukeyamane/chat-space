class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  def index
    @groups = current_user.groups
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

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_chats_path(@group), notice: 'グループの更新に成功しました'
    else
      flash[:alert] = 'グループの作成に更新しました'
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
