class BooksController < ApplicationController
  def index
    @book = Book.new
    #@bookに新しい箱を用意する
    @books = Book.all
    #@booksに複数データ(全データall)を格納する
    @user = current_user
  end
  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = @book.user
    #@book.user_idにログインユーザーのIDを入れる
    #@bookに新しい箱を用意する
    @books = Book.all
    if @book.save #bookが正常に保存したら
      redirect_to book_path(@book.id)
      #book_path(自分が投稿した本の一覧)へリダイレクトさせる
      flash[:notice] = "You have created book successfully"
      #上記のフラッシュを表示する
    else
      render :index
      #上のdef indexの処理を行う
    end
  end
  def edit
    @book = Book.find(params[:id])
    #id番目のbook情報を探して表示する
    if @book.user.id != current_user.id
      redirect_to books_path
    end
  end
  def update
    @book = Book.find(params[:id])
    #id番目のbook情報を@bookに入れる
    if @book.update(book_params) #@bookの更新が成功したら
      flash[:notice] = "Book was successfully updated."
      #上記のフラッシュを表示し
      redirect_to book_path(@book)
      #Book detailのページに飛ぶ
    else
      render :edit
      #上のdef editの処理を行う
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
  end
end
