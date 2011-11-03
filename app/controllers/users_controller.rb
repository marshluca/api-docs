class UsersController < BaseController
  inherit_resources
  actions :index, :show

  def show
    @logs = UserLog.where('author.name' => current_user.name)
    show!
  end
end
