class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @news = @user.news
  end

  def delete_all
    @user = User.find(params[:id])
    @news = @user.news
    @news.destroy_all
    redirect_to user_path(@user)
  end

end
