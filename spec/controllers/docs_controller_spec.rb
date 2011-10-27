require 'spec_helper'

describe DocsController do
  before (:each) do
    @user = Factory(:user)
    sign_in @user

    @doc = Factory(:doc)
  end

  describe "GET 'show'" do
    it "should find the right doc" do
      get :show, :id => @doc.id
      assigns(:doc).should == @doc
    end
  end
end
