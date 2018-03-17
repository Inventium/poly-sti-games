require "rails_helper"

RSpec.describe DiceGame, :type => :model do
  c = Craps.create(name: "Craps", difficulty: "Hard", num_die: 4, max_players: 6, odds: 0.42, dots_on_dice: 3)
  sb = SicBo.create(name: "SicBo", difficulty: "Extreme", num_die: 1, max_players: 4, odds: 0.11, dots_on_dice: 12) 

  it '#all should return all betting games' do
    games = DiceGame.all

    expect(games).to include(c)
    expect(games).to include(sb)
  end
end