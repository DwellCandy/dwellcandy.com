class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :last_name
      t.text :image
      t.text :url
      t.string :location
      t.text :oauth_token
      t.datetime :oauth_expires

      t.timestamps
    end
  end
end
