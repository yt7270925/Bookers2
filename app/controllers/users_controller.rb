class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books #特定のユーザに関連付けられた投稿すべてを取得し@booksにわたす、個人が投稿したものすべてを表示、アソシエーションを持ってる者同士の記述
  end

  def edit
  end
end
