class ProjectsController < BaseController
  inherit_resources
  actions :all

  def create
    @project = Project.new(params[:project])
    @project.author = Author.new(:name => current_user.name, :email => current_user.email)
    create!
  end
end
