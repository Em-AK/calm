class AddValidationToRefugeeProfile < ActiveRecord::Migration
  def change
    add_column :refugees, :confirmed, :boolean, default: false
  end
end
