class Notifications < ActionMailer::Base
  default :from => "from@example.com"

  def welcome(user)
    @user = user
    @url = 'localhost:3000/'
    # headers {"X-Spam" => 'value', "X-Special" => 'another_value'}
    attachments['rails.png'] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail :to => 'zhanglin@eoemobile.com', :subject => "Welcome to My Awesome Site."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.signup.subject
  #
  def signup
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.forgot_password.subject
  #
  def forgot_password
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.invoice.subject
  #
  def invoice
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
