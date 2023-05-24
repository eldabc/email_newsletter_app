class CreateEmailNewsletters < ActiveRecord::Migration[7.0]
  def self.up
    create_table :email_newsletters do |t|
      t.string :email
      t.text :preferences, array: true #, default: []
      t.timestamps
    end
  end

  def self.down
    drop_table "email_newsletters"
  end
end