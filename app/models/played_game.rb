class PlayedGame < ApplicationRecord
  belongs_to :casino
  belongs_to :game, polymorphic: true

  scope :card_games, -> { where(game_type: "CardGame") }
  scope :betting_games, -> { where(game_type: "BettingGame") }
  scope :dice_games, -> { where(game_type: "DiceGame") }

  validates :income, numericality: true
end
