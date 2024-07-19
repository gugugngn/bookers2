class BooksController < ApplicationController
  def new

  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @user = current_user
    @book_find = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)  # book投稿データを受け取り新規登録するためのインスタンス(空箱)作成
    @book.user_id = current_user.id   # 今ログイン中のユーザの情報を本の投稿データに持たせている。
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)    # どのデータを詳細画面に表示させるかには、idが必要
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
     @book = Book.find(params[:id])
  end

   def update
    book = Book.find(params[:id])
    if book.update(book_params)
       flash[:notice]= "You have updated book successfully."
       redirect_to books_path
    else
      render :edit
    end
   end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
    # paramsの中に投稿データが入っており、送られてきたデータの中からモデル名(book)を指定し絞り込み、保存を許可するカラムを指定している。
  end
end
