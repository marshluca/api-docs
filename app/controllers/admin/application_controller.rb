class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_filter :authenticate_user!
  before_filter :authenticate_admin!

  private
    def authenticate_admin!
      unless current_user.admin?
        redirect_to root_url, :alert => 'Access Denied.'
      end
    end
end