class NewsLetterMailer < ApplicationMailer
  default from: 'eldabc01@gmail.com'

  def welcome_email
    @email_newsletter = params[:email_newsletter]
    #debugger
    #@url  = 'http://example.com/login'
    mail(to: 'elda822@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
