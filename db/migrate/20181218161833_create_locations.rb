class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.column :sign, :string
      t.column :objective_id, :integer
      t.column :transition, :text
      t.column :pre_description, :text
      t.column :post_description, :text
      t.column :puzzle_solved, :boolean
    end
  end
end
