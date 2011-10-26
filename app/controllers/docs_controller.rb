class DocsController < BaseController
  before_filter :authenticate_user!

  def index
    @docs = Doc.all
  end

  def show
    @doc = Doc.find(params[:id])
  end
end
