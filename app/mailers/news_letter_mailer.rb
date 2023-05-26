class NewsLetterMailer < ApplicationMailer
  default from: 'paolabello3220@gmail.com'

  def thanks_to_suscriber(email_newsletter)
    @email_newsletter = email_newsletter
    
    mail(
          to: @email_newsletter[:email], 
          subject: t(:thanks_suscribe_newsletter)
        )
  end
end
