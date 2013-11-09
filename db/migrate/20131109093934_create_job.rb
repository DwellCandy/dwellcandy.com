class CreateJob < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :user
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
