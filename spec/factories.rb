FactoryBot.define do
  factory :texas_hold_em do
    name "TexasHoldEm"
    variant "Standard"
    deck_size 52
    rigged false
    max_players 10
  end

  factory :black_jack do
    name "BlackJack"
    variant "Really Unfair"
    deck_size 26
    rigged true 
    max_players 7
  end
end