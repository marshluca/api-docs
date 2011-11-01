class HomeController < BaseController
  def index
    @feeds = UserLog.all
  end
end
