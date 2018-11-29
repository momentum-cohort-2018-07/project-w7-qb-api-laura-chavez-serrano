class ApplicationMailer < ActionMailer::Base
  default from: 'laura.s.chavez@outlook.com'
  def sample_email(user)
    @user = user
  
    mail(to: @user.email, subject: 'TecSupport you have a new answare')
  end
  layout 'mailer'
end
