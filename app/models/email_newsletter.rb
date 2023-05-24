class EmailNewsletter < ApplicationRecord
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 
  validates :email, :preferences, presence: true

  after_initialize do |email_newsletter|
    #email_newsletter.preferences= [] if email_newsletter.preferences == nil
  end

end
