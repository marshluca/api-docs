class Admin::HomeController < Admin::ApplicationController
  def index
    @logs = UserLog.all
  end
end
