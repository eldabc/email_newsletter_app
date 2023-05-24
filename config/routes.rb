Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :email_newsletters
    root 'email_newsletters#index'
  end
end
