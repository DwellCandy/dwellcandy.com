class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.text :image
      t.text :url
      t.string :location
      t.text :oauth_token
      t.datetime :oauth_expires
      t.string :password_digest
      t.boolean :facebook, default: false

      t.timestamps
    end
  end
end
