class BooksController < ApplicationController
  def new

  end

  def index
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)  # book投稿データを受け取り新規登録するためのインスタンス(空箱)作成
    @book.user_id = current_user.id   # 今ログイン中のユーザの情報を本の投稿データに持たせている。
    @book.save
    redirect_to book_path(@book.id)    # どのデータを詳細画面に表示させるかには、idが必要
  end

  def destroy
  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
    # paramsの中に投稿データが入っており、送られてきたデータの中からモデル名(book)を指定し絞り込み、保存を許可するカラムを指定している。
  end
end
