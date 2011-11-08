class HomeController < BaseController
  def index
    @logs = UserLog.where(:doc_id.in => current_user.docs.map(&:id)).desc('updated_at')
  end
end
