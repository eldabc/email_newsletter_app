class AddConfirmToEmailNewsletter < ActiveRecord::Migration[7.0]
  def change
    add_column :email_newsletters, :confirm, :boolean, :default => false
  end

  def self.down
    remove_column :email_newsletters, :confirm
  end
end
