class Casino < ApplicationRecord
  has_many :played_games

  validates :name, presence: true

  def total_income
    played_games.pluck(:income).sum
  end

  def games_played
    played_games.count
  end

  def been_played?(game:)
    game = Game.find_by_name(name: game)

    played_games.where(game: game).any?
  end

  def income_by_game(game:)
    played_games.where(game: game).pluck(:income).sum
  end

  def most_played
    count = 0
    popular_game = nil
    # get all games played at the casino
    games = played_games.group(:game_id, :game_type).map(&:game)

    # get most popular game
    games.each do |game|
      times_played = played_games.where(game: game).count
      if times_played >= count
        count = times_played
        popular_game = game
      end
    end

    popular_game
  end
end
