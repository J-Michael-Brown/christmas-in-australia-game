class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.column :player_id, :integer
      t.column :description, :text
      t.column :complete, :boolean
    end
  end
end
