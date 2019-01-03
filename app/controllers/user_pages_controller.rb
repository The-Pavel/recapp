class UserPagesController < ApplicationController
  include Accessible

  skip_before_action :check_user, only: [:home, :user_dashboard]

  def user_dashboard
    if current_user
      @user = User.find(current_user.id)
      page = MetaInspector.new('https://www.gooverseas.com/articles')
      page2 = MetaInspector.new('https://www.goabroad.com/articles')
      p page.response.status
      # p page.response.headers
      go_links = page.links.http
      go_links.each do |link|
        pp = MetaInspector.new(link)
        p pp.best_description
      end

    else
      redirect_to(root_path)
    end
  end
end



