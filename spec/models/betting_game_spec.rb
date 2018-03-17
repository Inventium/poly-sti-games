require "rails_helper"

RSpec.describe BettingGame, :type => :model do
  e = Election.create(name: "Election", classification: "National", legality: "Unclear", max_players: 300000000, projected_gain: 99)
  lhr = HorseRace.create(name: "HorseRace", classification: "Local", legality: "Legal", max_players: 5000, projected_gain: 90)
  rhr = HorseRace.create(name: "HorseRace", classification: "Regional", legality: "Depends", max_players: 50000, projected_gain: 70)

  it '#all should return all betting games' do
    games = BettingGame.all

    expect(games).to include(e)
    expect(games).to include(lhr)
    expect(games).to include(rhr)
  end
end