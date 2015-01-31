class CreateRefugees < ActiveRecord::Migration
  def change
    create_table :refugees do |t|
      t.string :firstname
      t.string :name
      t.date :birthday
      t.string :nationality
      t.string :email
      t.text :description

      t.timestamps null: false
    end
  end
end
