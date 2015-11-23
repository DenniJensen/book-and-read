class UsersController < ApplicationController

  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Angemeldete Nutzer", :users_path

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end
end
