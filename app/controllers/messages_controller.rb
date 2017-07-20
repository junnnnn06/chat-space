class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_groups, :set_group, only: [:index, :create]

  def index
    @message = Message.new
    @messages = @group.messages.includes(:group)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @messages = @group.messages
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path}
        format.json
      end
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
