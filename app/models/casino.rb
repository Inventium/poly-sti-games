class Casino < ApplicationRecord
  has_many :played_games

  validates :name, presence: true
end
