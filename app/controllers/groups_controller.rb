class GroupsController < ApplicationController
  def index
    @groups = Groups.all.include(:chats)
  end
end
