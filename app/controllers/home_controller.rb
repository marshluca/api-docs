class HomeController < BaseController
  def index
    @logs = UserLog.all
  end
end
