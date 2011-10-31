class ProjectsController < BaseController
  inherit_resources
  actions :all

  def create
    params[:project].merge!(:author => {
      :id    => current_user.id,
      :name  => current_user.name,
      :email => current_user.email
    })
    create!
  end
end
