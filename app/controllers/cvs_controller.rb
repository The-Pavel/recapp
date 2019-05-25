class CvsController < ApplicationController

  skip_before_action :verify_authenticity_token
  Cloudinary::config({ cloud_name: 'thepav', api_key: ENV['api_key'], app_secret: ENV['app_secret']})

  def new
    @cv = Cv.new
    @cv.user = current_user
  end

  def create
    @cv = Cv.new(cv_params)
    @cv.user = current_user
    @cv.save
    redirect_to user_dashboard_path(current_user)
  end


  private

  def cv_params
    if params[:cv].present?
      params.require(:cv).permit(:title, :file, :file_cache, :is_video)
    else
      params.permit(:title, :file, :file_cache, :is_video)
   end
  end

end
