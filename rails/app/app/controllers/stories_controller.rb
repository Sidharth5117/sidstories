class StoriesController < ApplicationController


before_action :set_story, only: [:edit, :update, :show, :destroy]
before_action :require_user, except: [:index, :show]
before_action :require_same_user, only: [:edit, :update, :destroy]


 def new
  @storie = Storie.new
 end

 def index
  @storie = Storie.paginate(page: params[:page], per_page: 2)
 end
 

 def destroy 
  @storie = Storie.find(params[:id])
  @storie.destroy
  flash[:danger] = "Story was successfully deleted"
  redirect_to stories_path
 end

 def edit
  @storie = Storie.find(params[:id])
 end

 def update
  @storie = Storie.find(params[:id])
  if @storie.update(storie_params)
   flash[:success] = "Story was successfully updated"
   redirect_to @storie
  else
   render 'edit'
  end
 end

 def create
  
  @storie = Storie.new(storie_params)
  @storie.user = current_user  
  if @storie.save
    flash[:success] = "Story was successfully created"
    redirect_to @storie
  else
    render 'new'
  end
 
 end

 def show
  @storie = Storie.find(params[:id])
 end


 private
  def storie_params
   params.require(:storie).permit(:name, :content)
  end 

  def set_story
  @storie = Storie.find(params[:id])
  end

  def require_same_user
   if current_user != @storie.user
   flash[:danger] = "You can only edit your own articles"
   redirect_to root_path
   end
  end

end
