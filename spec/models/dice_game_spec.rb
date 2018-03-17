require "rails_helper"

RSpec.describe DiceGame, :type => :model do
  let!(:c)    { FactoryBot.create(:craps) }
  let!(:sb)   { FactoryBot.create(:sic_bo) }
  let(:games) { DiceGame.all }

  it '#all should return all dice games using STI' do
    expect(games).to include(c)
    expect(games).to include(sb)
  end
end