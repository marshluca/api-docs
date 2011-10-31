class DocsController < BaseController
  before_filter :find_project

  inherit_resources
  actions :index, :show

  private
    def find_project
      @project = Project.find(params[:project_id])
    end
end
