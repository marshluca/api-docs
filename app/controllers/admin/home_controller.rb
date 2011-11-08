class Admin::HomeController < Admin::ApplicationController
  def index
    @logs = UserLog.desc('updated_at')
  end
end
