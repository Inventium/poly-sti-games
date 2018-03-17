class Casino < ApplicationRecord
  has_many :played_games

  validates :name, presence: true 

  def total_income
    played_games.pluck(:income).sum
  end

  def games_played
    played_games.count
  end
end
