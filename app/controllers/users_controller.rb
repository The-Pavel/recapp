class UsersController < ApplicationController

skip_before_action :verify_authenticity_token
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # @position.tag_list = params[:tag_list]
    @user.save
  end

  def update_video
    @user = User.find(params[:id])
    folder = @user.id.to_s
    results = Cloudinary::Api.resources(type: 'upload', resource_type: 'video', prefix: folder)
    resources = results["resources"]
    ids = resources.map {|res| res["url"]}
    # ids.to_a.each do |video|
    #   if @user.video_array.include?(video)
    #     @user.video_array
    #   else
    #     @user.video_array << video
    #   end
    # end

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


  private
  def user_params
    params.permit(:id, :email, :first_name, :last_name)
  end

  def video_params
    params.permit(:id, :video_array)
  end

end
