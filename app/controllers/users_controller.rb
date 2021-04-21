class UsersController < ApplicationController
  def index
  end
  def show
    @user = User.find(params[:id])
    #ユーザーのidを探す
   # @post_books = @user.post_books.page(params[:page]).reverse_order
    #指定されたユーザ(@user)のみの投稿を表示させる
    #reverse_order:降順
  end
  def edit
    @user = User.find(params[:id])
    #ユーザーidを捜索
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    #@user内の指定されたidのユーザーのupdateをする
    redirect_to book_path(@user.id)
    #そのユーザーの投稿ページに飛ぶ
    end

    private
    def user_params
      params.require(:user).permit(:name, :body, :image)
      #require:ユーザを指定する
      #permit:requireで指定されたユーザのみが行える変更⇒ name profile_image
    end

  end
end
