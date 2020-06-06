class CategoriesController < ApplicationController

before_action :require_admin, except: [:index, :show]

def index
@category = Category.paginate(page: params[:page], per_page: 5)
end

def new
@category = Category.new
end

def create
@category = Category.new(category_params)
if @category.save
flash[:success] = "Category was created successfully"
redirect_to categories_path
else
render 'new'
end
end



def edit
@category = Category.find(params[:id])
end
def update
@category = Category.find(params[:id])
if @category.update(category_params)
flash[:success] = "Category name was successfully updated"
redirect_to category_path(@category)
else
render 'edit'
end
end



def show
@category = Category.find(params[:id])
@category_storie = @category.storie.paginate(page: params[:page], per_page: 3)
end

private

def category_params
params.require(:category).permit(:name)
end


def require_admin
if !logged_in? || (logged_in? and !current_user.admin? )
flash[:danger] = "Only Admins can perform this action"
redirect_to categories_path
end
end


end