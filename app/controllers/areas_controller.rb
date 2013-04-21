class AreasController < ApplicationController
  before_filter :signed_in_user
  
  def new
  	@area = Area.new
  end
  
  def index
  	@areas_all = Area.paginate(page: params[:page])
  	@areas = current_user.areas
  end
  
  def show
    @area = Area.find(params[:id])
    @posts = @area.posts.paginate(page: params[:page])
    @post = @area.posts.build if signed_in?
    @areas = current_user.areas
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
