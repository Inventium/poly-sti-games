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

  factory :election do
    name "Election"
    classification "National"
    legality "Unclear"
    max_players 300000000
    projected_gain 99  
  end

  factory :horse_race do
    name "HorseRace"
    classification "Local"
    legality "Legal"
    max_players 5000
    projected_gain 90
  end

  factory :craps do
    name "Craps"
    difficulty "Hard" 
    num_die 4
    max_players 6 
    odds 0.42
    dots_on_dice 3
  end

  factory :sic_bo do
    name "SicBo"
    difficulty "Extreme"
    num_die 1
    max_players 4
    odds 0.11
    dots_on_dice 12
  end
end
