class EmployerPagesController < ApplicationController
  include Accessible# include Accessible
  skip_before_action :check_user, only: [:home, :employer_dashboard]

  def employer_dashboard
    if current_employer
      @employer = Employer.find(current_employer.id)
    else
      redirect_to(root_path)
    end
  end

end
