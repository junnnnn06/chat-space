class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_groups, :set_group, only: [:index, :create]

  def index
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @messages = @group.messages
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id]), notice: "メッセージ送信成功"
    else
      flash.now[:alert] = "メッセージを入力して下さい"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_groups
    @groups = current_user.groups
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
