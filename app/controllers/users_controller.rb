class UsersController < BaseController
  inherit_resources
  actions :show

  def show
    @logs = UserLog.where('author.name' => current_user.name)
    show!
  end
end
