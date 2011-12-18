class Notifications < ActionMailer::Base
  default :from => "api@eoemobile.com"

  # Notifications.welcome(current_user).deliver
  def welcome(user)
    @user = user
    attachments['rails.png'] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail :to => 'zhanglin@eoemobile.com', :subject => "Welcome to My Awesome Site."
  end

  def signup
    @greeting = "Hello, "
    mail :to => 'zhanglin@eoemobile.com', :subject => "Signup"
  end
end
