class PostsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    @area = Area.find(params[:post][:area_id])
    
    @postn = current_user.posts.build(area_id: @area.id, 
          content: params[:post][:content])
    
    if @postn.save
      flash[:success] = "Posted successfully!"
    end
    redirect_to @area
  end

  def destroy
  	@post = Post.find(params[:id])
    @area = Area.find(@post.area_id)
    @post.destroy 
    
    redirect_to @area
  end
  
  private

  
  	def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_url if @post.nil?
    end
end