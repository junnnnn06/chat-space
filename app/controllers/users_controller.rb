class UsersController < ApplicationController

  def index
    @users = User.search_by_name(params[:keyword], current_user)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
  end

  def new
  end

  def update
    if current_user.update(user_params)
     redirect_to root_path, notice: "success"
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name,:email)
    end
end
