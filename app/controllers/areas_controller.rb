class AreasController < ApplicationController
  before_filter :signed_in_user
  
  def new
  	@area = Area.new
  end
  
  def index
  	@areas = Area.paginate(page: params[:page])
  end
  
  def show
    @area = Area.find(params[:id])
    @posts = @area.posts.paginate(page: params[:page])
    @post = @area.posts.build if signed_in?
    store_location
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
  
  

end
