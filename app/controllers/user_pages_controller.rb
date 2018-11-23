class UserPagesController < ApplicationController
  include Accessible
  skip_before_action :check_user, only: [:home, :user_dashboard]

  def user_dashboard
    if current_user
      @user = User.find(current_user.id)
    else
      redirect_to(root_path)
    end
  end
end

