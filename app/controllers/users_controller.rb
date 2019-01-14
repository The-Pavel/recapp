class UsersController < ApplicationController

skip_before_action :verify_authenticity_token
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
  end

  def update_video
    @user = User.find(params[:id])
    folder = @user.id.to_s
    results = Cloudinary::Api.resources(type: 'upload', resource_type: 'video', prefix: folder)
    resources = results["resources"]
    ids = resources.map {|res| res["url"]}
    @user.video_array.replace(ids)
    @user.update(video_params)
    @user.save
    respond_to do |format|
      format.json {render json: @user}
      format.html {redirect_to user_dashboard_path(@user)}
    end

    rescue Cloudinary::CarrierWave::UploadError
      render plain: "File couldn't be uploaded"
  end

  def update_cv
    @user = User.find(params[:id])
    folder = @user.id.to_s
    results = Cloudinary::Api.resources(type: 'upload', prefix: folder, format: 'pdf')
    resources = results["resources"]
    ids = resources.map {|res| res["url"]}
    @user.cv_array.replace(ids)
    @user.update(cv_params)
    @user.save
    respond_to do |format|
      format.json {render json: @user}
      format.html {redirect_to user_dashboard_path(@user)}
    end

    rescue Cloudinary::CarrierWave::UploadError
      render plain: "File couldn't be uploaded"
  end

  private
    def user_params
      params.permit(:id, :email, :first_name, :last_name)
    end

    def video_params
      params.permit(:id, :video_array)
    end

    def cv_params
      params.permit(:id, :cv_array)
  end

end
