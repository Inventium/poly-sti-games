require 'rails_helper'

RSpec.describe BettingGame, type: :model do
  let!(:e)    { FactoryBot.create(:election) }
  let!(:lhr)  { FactoryBot.create(:horse_race) }
  let!(:rhr)  { FactoryBot.create(:horse_race, classification: 'regional') }
  let(:games) { BettingGame.all }

  it '#all should return all betting games using STI' do
    expect(games).to include(e)
    expect(games).to include(lhr)
    expect(games).to include(rhr)
  end
end
