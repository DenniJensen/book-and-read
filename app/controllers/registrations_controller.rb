class RegistrationsController < Devise::RegistrationsController
  after_action :add_name_to_user, only: [:create, :update]

  protected

  def add_name_to_user
    if @user.save
      @user.first_name = user_name[:first_name]
      @user.last_name = user_name[:last_name]
      @user.save
    end
  end

  def user_name
    params.require(:user).permit(:first_name, :last_name)
  end

  def after_sign_up_path_for(resource)
  end
end
