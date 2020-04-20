class StoriesController < ApplicationController

 def new
  @storie = Storie.new
 end

 def index
  @storie = Storie.all
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

end
