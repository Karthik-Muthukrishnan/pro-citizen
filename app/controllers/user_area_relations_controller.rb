class UserAreaRelationsController < ApplicationController
  before_filter :signed_in_user

  def create
    @area = Area.find(params[:user_area_relation][:area_id])
    UserAreaRelation.create!(area_id: @area.id, user_id: current_user.id)
	
	respond_to do |format|
      format.html { redirect_to @area }
      format.js
    end
    
  end

  def destroy
    
    @uar = UserAreaRelation.find(params[:id])
    @area = Area.find(@uar.area_id)
    @uar.destroy 
    
    respond_to do |format|
      format.html { redirect_to @area }
      format.js
    end
    
  end
  
  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end