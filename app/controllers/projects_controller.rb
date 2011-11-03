class ProjectsController < BaseController
  inherit_resources
  actions :index, :show

  def index
    @projects = Project.where :name.in => current_user.projects
  end
end
