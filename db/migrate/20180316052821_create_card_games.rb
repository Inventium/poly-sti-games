class CreateCardGames < ActiveRecord::Migration[5.0]
  def change
    create_table :card_games do |t|
      t.string :name
      t.string :variant
      t.integer :deck_size
      t.boolean :rigged
      t.integer :num_players

      t.timestamps
    end
  end
end
