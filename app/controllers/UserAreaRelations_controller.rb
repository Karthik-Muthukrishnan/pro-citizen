class UserAreaRelationsController < ApplicationController
  before_filter :signed_in_user

  def create
    @area.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to @user
  end
end