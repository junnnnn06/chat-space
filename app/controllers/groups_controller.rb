class GroupsController < ApplicationController

  def index
    @message = Message.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: "チャットグループが作成されました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
