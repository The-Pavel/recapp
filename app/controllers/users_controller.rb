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
    results = Cloudinary::Api.resources(cloud_name: 'thepav', type: 'upload', resource_type: 'video', prefix: folder)
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

  def delete_video(video)
    url = video.split('/').last.split('.').first
    Cloudinary::Uploader.destroy('#{current_user.id.to_s}/#{url}', resource_type: 'video')
    current_user.update_video
  end

  def update_cv
    @user = User.find(params[:id])
    folder = @user.id.to_s
    results = Cloudinary::Api.resources(type: 'upload', prefix: folder, resource_type: 'raw')
    results2 = Cloudinary::Api.resources(type: 'upload', prefix: folder, format: 'pdf')
    resources = results["resources"]
    resources2 = results2["resources"]
    ids = resources.map {|res| res["url"]}
    ids2 = resources2.map {|res| res["url"]}
    cv_urls = ids + ids2
    @user.cv_array.replace(cv_urls)
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
