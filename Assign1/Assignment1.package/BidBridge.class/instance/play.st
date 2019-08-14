RandomPlay
play
"Creates a shuffled deck of cards using Fisher-Yates algorithm"
|cardIndex random temp|
cardIndex := Array new:52.
1 to: 52 do: [ :each | cardIndex at: each put:each ].

52 to: 1 by: -1 do: [ :each | random := (1 to: each) atRandom. 
										 temp := cardIndex at: (random asInteger).
											cardIndex at: (random asInteger) put: (cardIndex at: each).
											  cardIndex at: each put:temp asInteger].
 BidBridge new withPremutation:  cardIndex.