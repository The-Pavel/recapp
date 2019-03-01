class CvsController < ApplicationController
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
    params.require(:cv).permit(:title, :file, :file_cache, :is_video)
  end
end
