class CreatePlayedGames < ActiveRecord::Migration[5.0]
  def change
    create_table :played_games do |t|
      t.integer :casino_id
      t.integer :game_id
      t.string :game_type
      t.float :income

      t.timestamps

      t.index [:casino_id, :game_id]
      t.index [:game_id, :casino_id]
    end
  end
end
