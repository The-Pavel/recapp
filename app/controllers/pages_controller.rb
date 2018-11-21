class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :employer_dashboard]
  skip_before_action :authenticate_employer!, only: [:home]

  def home
  end

  def employer_dashboard
    @employer = Employer.find(params[:employer_id])
  end

end
