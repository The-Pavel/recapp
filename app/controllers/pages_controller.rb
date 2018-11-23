class PagesController < ApplicationController

  before_action :authenticate_user!, except: [:home]
  before_action :authenticate_employer!, except: [:home]

  def home
  end

end
