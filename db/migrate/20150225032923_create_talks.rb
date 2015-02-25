class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.references :user, index: true
      t.string :topics
      t.date :date
      t.boolean :completed

      t.timestamps null: false
    end
    add_foreign_key :talks, :users
  end
end
