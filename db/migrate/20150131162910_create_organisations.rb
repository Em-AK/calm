class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :website

      t.timestamps null: false
    end

    add_column :mediators, :organisation_id, :integer
    add_index :mediators, :organisation_id

    add_column :refugees, :mediator_id, :integer
    add_index :refugees, :mediator_id

  end
end
