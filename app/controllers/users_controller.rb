class UsersController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb "Startseite", :root_path

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end
end
