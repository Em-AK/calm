class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :max_guests
      t.string :location
      t.text :description
      t.references :host, index: true

      t.timestamps null: false
    end
  end
end
