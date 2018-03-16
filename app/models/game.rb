class Game < ApplicationRecord
  has_and_belongs_to_many :casinos
end
