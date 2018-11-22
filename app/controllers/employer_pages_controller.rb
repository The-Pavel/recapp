class EmployerPagesController < ApplicationController
  # include Accessible
  # skip_before_action :check, only: [:home, :employer_dashboard]
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_employer!, only: [:home, :employer_dashboard]


  def employer_dashboard
    @employer = Employer.find(params[:employer_id])
  end

end
