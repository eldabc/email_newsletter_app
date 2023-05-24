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

    respond_to do |format|      
      #if EmailVerify.new(@email_newsletter.email).verified
      debugger
        if @email_newsletter.save
          NewsLetterMailer.with(email_newsletter: @email_newsletter).welcome_email.deliver_now
          format.html { redirect_to email_newsletter_url(@email_newsletter), notice: "Email newsletter was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      #else
      #  @email_newsletter.errors.add(:base, "Email no reune las condiciones para añadirse al boletin")
      #  format.html { render :new, status: :unprocessable_entity }
      #end
    end
  end


  def destroy
    @email_newsletter.destroy

    respond_to do |format|
      format.html { redirect_to email_newsletters_url, notice: "Email newsletter was successfully destroyed." }
    end
  end

  private

    def set_email_newsletter
      @email_newsletter = EmailNewsletter.find(params[:id])
    end

    def email_newsletter_params
      params.require(:email_newsletter).permit(:email, preferences: [] ) #"women_fashion", "men_fas hion", "children_fashion"
    end
end
