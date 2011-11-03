class DocsController < BaseController
  before_filter :find_project

  inherit_resources
  actions :index, :show

  belongs_to :project

  def category
    @docs = @project.docs.where(:category => params[:cate])
    render :index
  end

  private
    def find_project
      @project = Project.find(params[:project_id])
    end
end
