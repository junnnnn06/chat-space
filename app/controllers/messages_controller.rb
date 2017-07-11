class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @groups = current_user.groups
  end

  def create
    @message = Message.new(message_params)
    if message.save
      redirect_to group_message_path, notice: "メッセージ送信成功"
    else
      flash.now[:alert] = "メッセージを入力して下さい"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:image, :body).merge(user_id: current_user.id)
  end
end
