class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    # @group = Group.find(params[:id])
  end
end
