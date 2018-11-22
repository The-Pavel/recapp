class UserPagesController < ApplicationController
  # skip_before_action :check, only: [:home, :user_dashboard]
  skip_before_action :authenticate_user!, only: [:home]
  # after_action only: :user_dashboard, :update, :destroy
  # skip_before_action :authenticate_employer!


  def user_dashboard
    @user = User.find(params[:user_id])
  end
end

