class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :size, default: 3
      t.string :board

      t.timestamps null: false
    end
  end
end
