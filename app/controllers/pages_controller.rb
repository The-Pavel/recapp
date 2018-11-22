class PagesController < ApplicationController
  # include Accessible
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_employer!

  def home

  end

end
