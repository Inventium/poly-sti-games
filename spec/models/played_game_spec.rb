require 'rails_helper'

RSpec.describe PlayedGame, type: :model do
  let(:casino) { FactoryBot.create(:casino) }
  let(:black_jack) { FactoryBot.create(:black_jack) }
  let(:horse_race) { FactoryBot.create(:horse_race) }
  let(:craps) { FactoryBot.create(:craps) }

  let!(:bj_game) do
    FactoryBot.create(:played_game, casino: casino, game: black_jack)
  end

  let!(:hr_game) do
    FactoryBot.create(:played_game, casino: casino, game: horse_race)
  end

  let!(:c_game) do
    FactoryBot.create(:played_game, casino: casino, game: craps)
  end

  describe 'scopes' do
    it 'should return CardGames' do
      expect(PlayedGame.card_games).to contain_exactly(bj_game)
    end

    it 'should return BettingGames' do
      expect(PlayedGame.betting_games).to contain_exactly(hr_game)
    end

    it 'should return DiceGames' do
      expect(PlayedGame.dice_games).to contain_exactly(c_game)
    end
  end
end
