class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    #@user = User.find param[:id]
    @user = User.first
  end
end
