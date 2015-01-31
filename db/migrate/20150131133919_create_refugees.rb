class CreateRefugees < ActiveRecord::Migration
  def change
    create_table :refugees do |t|
      t.string :firstname
      t.string :name
      t.date :birthday
      t.string :nationality
      t.text :description
    end
  end
end
