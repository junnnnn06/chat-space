class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  # before_action :set_group, only: [:index, :create]
  # before_action :set_group_info, only: [:index, :create]

  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def create
    @groups = current_user.groups
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: 'index', notice: "メッセージ送信成功"
    else
      flash.now[:alert] = "メッセージを入力して下さい"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:image, :body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def set_group_info
    self.group_id = current_user.group_id
  end
end
