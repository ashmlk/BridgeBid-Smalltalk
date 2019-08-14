premutation
withPremutation: anArray
"Deals the cards and does bidding"
	| deckOfCards nIndex sIndex wIndex eIndex i|
	deckOfCards := #('2C' '3C' '4C' '5C' '6C' '7C' '8C' '9C' '10C' 'JC' 'QC' 'KC' 'AC' '2D' '3D' '4D' '5D' '6D' '7D' '8D' '9D' '10D' 'JD' 'QD' 'KD' 'AD' '2H' '3H' '4H' '5H' '6H' '7H' '8H' '9H' '10H' 'JH' 'QH' 'KH' 'AH' '2S' '3S' '4S' '5S' '6S' '7S' '8S' '9S' '10S' 'JS' 'QS' 'KS' 'AS').
	nIndex := OrderedCollection new.
	sIndex := OrderedCollection new.
	eIndex := OrderedCollection new.
	wIndex := OrderedCollection new.
	sCards := OrderedCollection new.
	wCards := OrderedCollection new.
	eCards := OrderedCollection new.
	nCards := OrderedCollection new.
	players := Array new: 4.
	"i is the index of each card in the array(anArray) that should be handed base on give array to the method"
	i := 1.
	"Deals the cards"
	anArray size timesRepeat: [ (i <= anArray size) ifTrue:[wIndex add: (anArray at: i). i := i + 1]. 
												 (i <= anArray size) ifTrue:[nIndex add: (anArray at: i). i := i + 1].
													(i <= anArray size) ifTrue:[eIndex add: (anArray at: i). i := i + 1].
														(i <= anArray size) ifTrue:[sIndex add:(anArray at: i)]. i := i + 1.].
	"Sorts and reverse the order of each players card index in order to sort t from highest to lowest"
	sIndex sort.
	sIndex := sIndex reverse.
	nIndex sort.
	nIndex := nIndex reverse.
	eIndex sort.
	eIndex := eIndex reverse.
	wIndex sort.
	wIndex := wIndex reverse.
	sIndex do: [ :each | sCards add: (deckOfCards at: each) ].
	wIndex do: [ :each | wCards add: (deckOfCards at: each) ].
	nIndex do: [ :each | nCards add: (deckOfCards at: each) ].
	eIndex do: [ :each | eCards add: (deckOfCards at: each) ].
	"Builds each player and adds to the an Array for biding"
	southPlayer := Player new buildPlayer: sCards.
	westPlayer := Player new buildPlayer: wCards.
	northPlayer := Player new buildPlayer: nCards.
	eastPlayer := Player new buildPlayer: eCards.
	southPlayer setPartner: northPlayer.
	northPlayer setPartner: southPlayer.
	westPlayer setPartner: eastPlayer.
	eastPlayer setPartner: westPlayer.
	players at: 1 put: southPlayer.
	players at: 2 put: westPlayer.
	players at: 3 put: northPlayer.
	players at: 4 put: eastPlayer.
	"Biding"
	BidBridge new bid: players.
	