class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    #TODO FIX for sign in
    @user = User.find params[:id]
  end

  def books
    @user = User.find params[:user_id]
    @books = @user.books
    render 'books/index'
  end
end
