class UserMailer < ActionMailer::Base
  default from: "postmaster@yiyepianzhou.top‍"
  def welcom_email(user)
    @user = user
    mail(to: @user.email,subject:'Welcom')
  end
end
