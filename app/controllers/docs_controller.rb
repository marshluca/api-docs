class DocsController < ApplicationController
  def index
    @docs = Doc.all
  end

  def show
    @doc = Doc.find(params[:id])
  end
end
