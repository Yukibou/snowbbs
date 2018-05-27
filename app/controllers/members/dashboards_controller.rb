class Members::DashboardsController < Members::ApplicationController
  def index
    @users = User.joins(:observations).group('users.id').order('count(users.id) DESC').limit 20
    @areas = Area.joins(:observations).group('areas.id').order('count(areas.id) DESC')
    @observation_counts_by_date = Observation.group("DATE(created_at)").order("DATE(created_at)").count
  end
end
