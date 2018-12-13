class CreateChristmasRpg < ActiveRecord::Migration[5.2]
  def change

    create_table :players do |t|
      t.column :name, :string
      t.column :location_id, :integer
      t.column :objective_id, :integer

      t.timestamps
    end

    create_table :locations do |t|
      t.column :objective_id, :integer
      t.column :transition, :text
      t.column :pre_description, :text
      t.column :post_description, :text
      t.column :puzzle_solved, :boolean
    end

    create_table :items do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :location_id, :integer
      t.column :found, :boolean
    end

    create_table :objectives do |t|
      t.column :description, :text
      t.column :complete, :boolean
    end

  end
end
