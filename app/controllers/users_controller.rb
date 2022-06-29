class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books #特定のユーザに関連付けられた投稿すべてを取得し@booksにわたす、個人が投稿したものすべてを表示、アソシエーションを持ってる者同士の記述
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id) #userのshowページへのリダイレクト
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
