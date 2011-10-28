require 'spec_helper'

describe DocsController do
  before (:each) do
    @user = Factory(:user)
    sign_in @user

    @doc = Factory(:doc)
    @project = Factory(:project)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get "index", :project_id => @project.id
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should find the right project" do
      get 'show', :project_id => @project.id, :id => @doc.id
      response.should be_success
    end
  end
end
