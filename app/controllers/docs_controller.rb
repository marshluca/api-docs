class DocsController < BaseController
  before_filter :find_project

  actions :index, :show

  private
    def find_project
      @project = Project.find(params[:project_id])
    end
end
