class UsersController < ApplicationController
  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Angemeldete Nutzer", :users_path

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end
end
