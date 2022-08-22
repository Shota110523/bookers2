class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end
  

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to "/users"
  end
  
  private

  def users_params
    params.require(:user).permit(:title, :body, :image)
  end
end