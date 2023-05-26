Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do

    root 'email_newsletters#index'
    resources :email_newsletters, :only => [:new, :create, :index, :show, :destroy]
    get 'email_newsletters/confirm/:newsletter_id', to: 'email_newsletters#confirm'
    
  end
end
