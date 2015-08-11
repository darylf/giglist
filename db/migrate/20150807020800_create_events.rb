class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date, null: false
      t.references :venue, null: false
      t.boolean :cancelled, null: false, default: false
      t.timestamps null: false
    end

    add_index :events, :venue_id
  end
end
