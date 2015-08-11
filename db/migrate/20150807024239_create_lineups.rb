class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.references :artist, null: false
      t.references :event, null: false
      t.integer :sort_order, null: false, default: 0
      t.timestamps null: false
    end

    add_index :lineups, [:artist_id, :event_id]
    add_index :lineups, [:artist_id, :event_id, :sort_order]
  end
end
