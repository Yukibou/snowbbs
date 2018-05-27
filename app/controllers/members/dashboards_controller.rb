class Members::DashboardsController < Members::ApplicationController
  def index
    @users = User.joins(:observations).group('users.id').order('count(users.id) DESC').limit 10
    @areas = Area.joins(:observations).group('areas.id').order('count(areas.id) DESC')
  end
end
