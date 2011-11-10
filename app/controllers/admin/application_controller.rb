class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_filter :authenticate_user!
  before_filter :authorize_admin!

  private
    def authorize_admin!
      unless current_user.admin?
        redirect_to root_url, :alert => 'Access Denied.'
      end
    end
end
