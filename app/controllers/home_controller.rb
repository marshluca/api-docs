class HomeController < BaseController
  def index
    @logs = UserLog.where(:doc_id.in => current_user.docs.map(&:id))
  end
end
