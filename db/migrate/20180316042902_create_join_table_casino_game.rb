class CreateJoinTableCasinoGame < ActiveRecord::Migration[5.0]
  def change
    create_join_table :casinos, :games do |t|
      t.index [:casino_id, :game_id]
      t.index [:game_id, :casino_id]
    end
  end
end
