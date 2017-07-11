class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @groups = current_user.groups
  end

  def create
  end

end
