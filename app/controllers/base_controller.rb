class BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_default_project

  private
  def set_default_project
    @project = Project.where(:name => current_user.projects.last).first
  end
end
