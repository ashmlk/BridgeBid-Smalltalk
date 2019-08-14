Biding
bid: gamers
"This method does the biding of the game"
|numPasses|
	gameProcess := OrderedCollection new.
	numPasses := 0.
	gamers do: [ :each | (each getPoints < 13 ) ifTrue:[each getOpen ifTrue:["Player is below 13 points but has opened"] 
																ifFalse:[each getPartner getOpen ifFalse:[gameProcess add: 'Pass'. numPasses := numPasses + 1]
																												ifTrue:[each setOpen: true.
																each getPoints >= 10 ifTrue:[].
																each getPoints >=8 & each getPoints < 10 ifTrue:[].
																 each getPoints >=6 & each getPoints < 8 ifTrue:[].
																	each getPoints < 6 ifTrue:[each setOpen: false. gameProcess add: 'Pass'. numPasses := numPasses + 1.] ]]].																		
								(each getPoints >= 13) ifTrue:[each getOpen ifTrue:["Player above 13 and has opened"]
																	 ifFalse:["Player above 13 and hasnt opened yet"]] ].