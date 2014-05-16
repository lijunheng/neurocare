class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

  def support_notification(sender)
    @sender = sender
    mail(:to => "exeusers@gmail.com",
         :from => sender.email,
         :subject => "New #{sender.support_type}")
 end
end
