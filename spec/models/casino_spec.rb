require 'rails_helper'

RSpec.describe Casino, type: :model do
  let(:casino) { FactoryBot.create(:casino) }
  let(:casino2) { FactoryBot.create(:casino, name: 'MGM') }
  let(:the) { FactoryBot.create(:texas_hold_em) }
  let(:bj) { FactoryBot.create(:black_jack) }
  let!(:played_game) do
    FactoryBot.create(:played_game, casino: casino, game: the)
  end

  it 'should validate presence of name' do
    expect(Casino.new).not_to be_valid
    expect(Casino.new(name: 'Rivers')).to be_valid
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

  describe '#been_played?' do
    it 'should return true if the game has been played at the casino' do
      expect(casino.been_played?(game: 'TexasHoldEm')).to be true
    end

    it 'should return false if the game has not been played at the casino' do
      expect(casino.been_played?(game: 'Election')).to be false
    end
  end

  describe '#income_by_game' do
    let!(:played_game2) { FactoryBot.create(:played_game, casino: casino, game: the) }

    it 'should return the income segmented by game' do
      expect(casino.income_by_game(game: the)).to eq 200

      FactoryBot.create(:played_game, casino: casino, game: bj)

      expect(casino.income_by_game(game: the)).to eq 200
    end
  end

  describe '#most_played' do
    let!(:pg) { FactoryBot.create(:played_game, casino: casino, game: the) }
    let!(:pg2) { FactoryBot.create(:played_game, casino: casino, game: bj) }

    # TexasHoldEm played twice
    it 'should return the most played game at the casino' do
      expect(casino.most_played).to eq the
    end

    context 'when youre DJ Khaled...' do
      let(:dj_khaled) { FactoryBot.build(:casino, name: 'DJ Khaled') }

      before do
        allow(dj_khaled).to receive(:most_played).and_return('Congratulations, you played yourself')
      end

      it 'you played yourself' do
        expect(dj_khaled.most_played).to eq 'Congratulations, you played yourself'
      end
    end
  end
end
