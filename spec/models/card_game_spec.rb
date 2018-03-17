require "rails_helper"

RSpec.describe CardGame, :type => :model do
  let!(:bbj) { FactoryBot.create(:black_jack, variant: "Beginner") }
  let!(:rubj) { FactoryBot.create(:black_jack) }
  let!(:the) { FactoryBot.create(:texas_hold_em) }

  it '#all should return all card games' do
    games = CardGame.all

    expect(games).to include(bbj)
    expect(games).to include(rubj)
    expect(games).to include(the)
  end
end