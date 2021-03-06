class PositionsController < ApplicationController

  def new
    if current_employer
      @position = Position.new
    else
      flash[:alert] = "You are not allowed to create jobs"
      redirect_to(root_path)
    end
  end

  def create
    @position = Position.new(position_params)
    # @position.tag_list = "#{params[:tags]}"
    # @user = Employer.find(params[:user_id])
    @position.employer = current_employer
    # @position.tag_list = params[:tag_list]
    @position.save
    redirect_to employer_dashboard_path(current_employer)
  end

  def show
    @position = Position.find(params[:id])
    @employer = Employer.find(@position.employer_id)
  end

  def update
    @position = Position.find(params[:id])
    @position.update(position_params)
    # @position.tag_list = params[:tag_list]
    @position.save
    redirect_to show_position_path(@position)
  end

  def edit
     @position = Position.find(params[:id])
     if current_employer.id != @position.employer_id
       flash[:alert] = "You are not allowed to edit this job"
       redirect_to(root_path)
     end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to employer_dashboard_path(current_employer)
  end

  private
  def position_params
    params.require(:position).permit(:id, :title, :location, :min_salary, :max_salary, :active_status, :occupation_type, :responsibilities, :requirements, :employer_id, :tag_list)
  end

end
