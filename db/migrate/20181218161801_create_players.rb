class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.column :name, :string
      t.column :location_id, :integer
      t.column :objective_id, :integer

      t.timestamps
    end
  end
end
