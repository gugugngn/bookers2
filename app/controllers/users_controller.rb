class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @user_books = @user.books
  end

  def create

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice]= "You have updated user successfully."
    redirect_to user_path
    else
    render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image)

  end

end

