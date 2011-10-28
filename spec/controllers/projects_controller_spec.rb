require 'spec_helper'

describe ProjectsController do

  before (:each) do
    @user = Factory(:user)
    sign_in @user

    @project = Factory(:project)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should find the right project" do
      get :show, :id => @project.id
      assigns(:project).should == @project
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
