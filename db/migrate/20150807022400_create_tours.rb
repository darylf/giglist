class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    add_column :events, :tour_id, :integer
    add_index :events, :tour_id
  end
end
