class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.column :action, :string
      t.column :location_id, :integer
      # t.column :value, :integer
    end
  end
end
