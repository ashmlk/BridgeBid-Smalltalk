LargestSuit
largestSuit
	| array max |
	array := Array new: 4.
	array at: 1 put: numClubs.
	array at: 2 put: numDiamonds.
	array at: 3 put: numHearts.
	array at: 4 put: numSpades.
	array sort.
	max := array last.
	max asInteger.
	^ max