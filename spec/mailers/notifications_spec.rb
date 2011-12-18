require "spec_helper"

describe Notifications do
  describe "signup" do
    let(:mail) { Notifications.signup }

    it "renders the headers" do
      mail.subject.should eq("Signup")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "forgot_password" do
    let(:mail) { Notifications.forgot_password }

    it "renders the headers" do
      mail.subject.should eq("Forgot password")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "invoice" do
    let(:mail) { Notifications.invoice }

    it "renders the headers" do
      mail.subject.should eq("Invoice")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
