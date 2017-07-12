class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_group, only: [:index, :create]

  def index
    @message = @group
    @messages = Message.new
  end

  def create
    @groups = current_user.groups
    @messages = Message.new(message_params)
    if @messages.save
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

  def set_group
    @group = current_user.groups
  end
end
