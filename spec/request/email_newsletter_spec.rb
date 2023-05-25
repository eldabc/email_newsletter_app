require 'rails_helper'

RSpec.describe "EmailNewsLetter", type: :request do
    let(:email_newsletter_params) do
        {
            email_newsletter: {
                email: Faker::Internet.email,
                preferences: ["women_fashion", "men_fashion", "children_fashion"]
            }
            
        }
    end

    describe "When user entry data" do
        it "should create the email newsletter" do
            post "/email_newsletters", params: email_newsletter_params
            expect(response).to have_http_status(:found)
            registred = EmailNewsletter.all
            expect(registred.count).to eq(1)
            expect(registred.first.email).to eq(email_newsletter_params[:email_newsletter][:email])
        end
    end
end