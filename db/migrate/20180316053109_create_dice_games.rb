class CreateDiceGames < ActiveRecord::Migration[5.0]
  def change
    create_table :dice_games do |t|
      t.string :name
      t.string :difficulty
      t.integer :num_die
      t.integer :max_players
      t.float :odds
      t.integer :dots_on_dice

      t.timestamps
    end
  end
end
