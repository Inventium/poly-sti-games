class CreateBettingGames < ActiveRecord::Migration[5.0]
  def change
    create_table :betting_games do |t|
      t.string :name
      t.string :classification
      t.string :legality
      t.integer :max_players
      t.float :projected_gain

      t.timestamps
    end
  end
end
