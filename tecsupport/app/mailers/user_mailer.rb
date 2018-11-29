class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup.subject
  #
  def newanswer(user)
    @user = user
    @greeting = "You have a new answare in TecSupport! Your email address is #{@user.email}."
    mail(
      to: @user.email,
      from: 'laura.s.chavez@outlook.com',
      subject: 'New answer to this app!'
    )
  end
    def signup(user)
      @user = user
     
      @greeting = "thank you for suscribe to TecSupport! Your email address is #{@user.email}."
      mail(
      to: @user.email,
      from: 'laura.s.chavez@outlook.com',
      subject: 'Welcome to this app!'
    )
  end
end
