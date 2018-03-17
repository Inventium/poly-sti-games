# CardGames
bbj = BlackJack.create(name: 'BlackJack', variant: 'Beginner', deck_size: 104, rigged: false, max_players: 5)
rubj = BlackJack.create(name: 'BlackJack', variant: 'Really Unfair', deck_size: 26, rigged: true, max_players: 7)
the = TexasHoldEm.create(name: 'TexasHoldEm', variant: 'Standard', deck_size: 52, rigged: false, max_players: 10)

# BettingGames
e = Election.create(name: 'Election', classification: 'National', legality: 'Unclear', max_players: 300_000_000, projected_gain: 99)
lhr = HorseRace.create(name: 'HorseRace', classification: 'Local', legality: 'Legal', max_players: 5000, projected_gain: 90)
rhr = HorseRace.create(name: 'HorseRace', classification: 'Regional', legality: 'Depends', max_players: 50_000, projected_gain: 70)

# DiceGame
c = Craps.create(name: 'Craps', difficulty: 'Hard', num_die: 4, max_players: 6, odds: 0.42, dots_on_dice: 3)
sb = SicBo.create(name: 'SicBo', difficulty: 'Extreme', num_die: 1, max_players: 4, odds: 0.11, dots_on_dice: 12)

# Casinos
rivers = Casino.create(name: 'Rivers')
mgm = Casino.create(name: 'MGM Grand')
fw = Casino.create(name: 'Foxwoods')

PlayedGame.create(casino: rivers, game: bbj,  income: rand(100))
PlayedGame.create(casino: rivers, game: lhr,  income: rand(100))
PlayedGame.create(casino: rivers, game: c,    income: rand(100))
PlayedGame.create(casino: rivers, game: sb,   income: rand(100))
PlayedGame.create(casino: rivers, game: rubj, income: rand(100))

PlayedGame.create(casino: mgm, game: lhr, income: rand(100))
PlayedGame.create(casino: mgm, game: e, income: rand(100))
PlayedGame.create(casino: mgm, game: c, income: rand(100))
PlayedGame.create(casino: mgm, game: sb, income: rand(100))
PlayedGame.create(casino: mgm, game: the, income: rand(100))

PlayedGame.create(casino: fw, game: the, income: rand(100))
PlayedGame.create(casino: fw, game: the, income: rand(100))
PlayedGame.create(casino: fw, game: sb, income: rand(100))
PlayedGame.create(casino: fw, game: c, income: rand(100))
PlayedGame.create(casino: fw, game: bbj, income: rand(100))
PlayedGame.create(casino: fw, game: lhr, income: rand(100))
