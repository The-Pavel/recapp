class UserPagesController < ApplicationController
  include Accessible
  skip_before_action :check_user, only: [:home, :user_dashboard]
  Cloudinary::config({ cloud_name: 'thepav', api_key: ENV['api_key'], app_secret: ENV['app_secret']})


  def user_dashboard
    if current_user
      @user = User.find(current_user.id)
    else
      redirect_to(root_path)
    end
  end
end
