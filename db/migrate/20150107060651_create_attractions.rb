class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :midia
      t.string :display_date
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :attractions, :users
  end
end
