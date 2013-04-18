class AreasController < ApplicationController
  before_filter :signed_in_user
  
  def new
  	@area = Area.new
  end
  
  def index
  	@areas = Area.all
  end
  
  def show
    @area = Area.find(params[:id])
  end
  
  def create
    @area = Area.new(params[:area])
    if @area.save
      flash[:success] = "Circle defined!"
      # Handle a successful save.
      redirect_to @area
    else
      render 'new'
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
