class CreateConcertsUsers < ActiveRecord::Migration
  def change
    create_table :concerts_users do |t|

      t.timestamps null: false
    end
  end
end
