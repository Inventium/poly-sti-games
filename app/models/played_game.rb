class PlayedGame < ApplicationRecord
  belongs_to :casino
  belongs_to :game, polymorphic: true

  validates :income, numericality: true
end
