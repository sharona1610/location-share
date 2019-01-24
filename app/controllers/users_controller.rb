class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = params[:id] ? User.find(params[:id]) : current_user

    if @user == current_user
      @locations = Location.where(creator: @user)
      @locations_shared = @user.locations
    else
      @locations_shared = Location.where(creator: @user).where(public: true)
    end
    @users = User.where.not(id: @user.id)
  end
end
