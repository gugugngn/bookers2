class UsersController < ApplicationController
  def index

  end

  def show
      @user = User.find(params[:id])
      @book = Book.new
  end

  def create

  end

  def edit
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name)

  end

end

