class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      # t.column :player_id, :integer
      t.column :name, :string
      t.column :description, :string
      t.column :location_id, :integer
      t.column :found, :boolean
    end
  end
end
