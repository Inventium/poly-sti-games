class Game < ApplicationRecord
  def self.find_by_name(name:)
    CardGame.find_by(name: name) ||
      BettingGame.find_by(name: name) ||
      DiceGame.find_by(name: name)
  end
end
