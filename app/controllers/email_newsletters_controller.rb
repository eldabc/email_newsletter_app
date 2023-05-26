class EmailNewslettersController < ApplicationController
  before_action :set_email_newsletter, only: %i[ show destroy ]

  def index
    @email_newsletters = EmailNewsletter.all
  end

  def show
  end

  def new
    @email_newsletter = EmailNewsletter.new
  end

  def create
    @email_newsletter = EmailNewsletter.new(email_newsletter_params)
  
    resul_verify = EmailVerify.new(@email_newsletter.email).verify

      if resul_verify.class == String
        @email_newsletter.errors.add(:base, resul_verify)
        return render :new, status: :unprocessable_entity
      end

      if @email_newsletter.save
        NewsLetterMailer.thanks_to_suscriber(@email_newsletter).deliver
        redirect_to email_newsletter_url(@email_newsletter), notice: t(:newsletter_created)
      else
        render :new, status: :unprocessable_entity
      end
  end


  def destroy
    @email_newsletter.destroy
    redirect_to email_newsletters_url, notice: "Email newsletter was successfully destroyed."
  end

  private

    def set_email_newsletter
      @email_newsletter = EmailNewsletter.find(params[:id])
    end

    def email_newsletter_params
      params.require(:email_newsletter).permit(:email, preferences: [] )
    end
end
