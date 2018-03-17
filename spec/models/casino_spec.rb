require "rails_helper"

RSpec.describe Casino, :type => :model do
  let(:casino) { FactoryBot.create(:casino) }
  let(:casino2) { FactoryBot.create(:casino, name: "MGM") }
  let(:the) { FactoryBot.create(:texas_hold_em) }
  let(:bj) { FactoryBot.create(:black_jack) }
  let!(:played_game) do
    FactoryBot.create(:played_game, casino: casino, game: the)
  end

  it 'should validate presence of name' do
    expect(Casino.new()).not_to be_valid
    expect(Casino.new(name: "Rivers")).to be_valid
  end

  describe '#played_games' do
    it 'should return the games played at the casino' do
      expect(casino.played_games).to include(played_game)
      expect(casino2.played_games).not_to include(played_game)
    end
  end

  describe '#total_income' do
    # In our factory, we define the income of each game to be 100
    # for ease of calculation
    it 'should return the total income of the played games at the casino' do
      expect(casino.total_income).to eq 100

      FactoryBot.create(:played_game, casino: casino, game: bj)

      expect(casino.total_income).to eq 200
      expect(casino2.total_income).to eq 0
    end
  end

  describe '#games_played' do
    let!(:played_game2) do
      FactoryBot.create(:played_game, casino: casino, game: bj)
    end
    
    it 'should return the number of games played at the casino' do
      expect(casino.games_played).to eq 2
      expect(casino2.games_played).to eq 0
    end
  end
end
