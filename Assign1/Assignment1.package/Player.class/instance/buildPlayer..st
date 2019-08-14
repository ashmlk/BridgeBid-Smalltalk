BuildPlayer
buildPlayer: anArray
	points := 0.
	numClubs := 0.
	numDiamonds := 0.
	numHearts := 0.
	numSpades := 0.
	numVoids := 0.
	numSingleton := 0.
	numDoubleton := 0.
	open := false.
	NT := true.
	"Number of cards in each suit"
	anArray
		do: [ :card | 
			(card endsWith: 'C')
				ifTrue: [ numClubs := numClubs + 1 ].
			(card endsWith: 'D')
				ifTrue: [ numDiamonds := numDiamonds + 1 ].
			(card endsWith: 'H')
				ifTrue: [ numHearts := numHearts + 1 ].
			(card endsWith: 'S')
				ifTrue: [ numSpades := numSpades + 1 ] ].
	"Counting points"
	anArray
		do: [ :card | 
			(card allButLast = 'J')
				ifTrue: [ points := points + 1 ].
			(card allButLast ='Q')
				ifTrue: [ points := points + 2 ].
			(card allButLast ='K')
				ifTrue: [ points := points + 3 ].
			(card allButLast = 'A')
				ifTrue: [ points := points + 4 ] ].
	"Voids and points"
	numClubs = 0
		ifTrue: [ numVoids := numVoids + 1.
			points := points + 3 ].
	numDiamonds = 0
		ifTrue: [ numVoids := numVoids + 1.
			points := points + 3 ].
	numHearts = 0
		ifTrue: [ numVoids := numVoids + 1.
			points := points + 3 ].
	numSpades = 0
		ifTrue: [ numVoids := numVoids + 1.
			points := points + 3 ].
	"Singleton and points"
	numClubs = 1
		ifTrue: [ numSingleton := numSingleton + 1.
			points := points + 2 ].
	numDiamonds = 1
		ifTrue: [ numSingleton := numSingleton + 1.
			points := points + 2 ].
	numHearts = 1
		ifTrue: [ numSingleton := numSingleton + 1.
			points := points + 2 ].
	numSpades = 1
		ifTrue: [ numSingleton := numSingleton + 1.
			points := points + 2 ].
	"Doubleton and points"
	numClubs = 2
		ifTrue: [ numDoubleton := numDoubleton + 1.
			points := points + 1 ].
	numDiamonds = 2
		ifTrue: [ numDoubleton := numDoubleton + 1.
			points := points + 1 ].
	numHearts = 2
		ifTrue: [ numDoubleton := numDoubleton + 1.
			points := points + 1 ].
	numSpades = 2
		ifTrue: [ numDoubleton := numDoubleton + 1.
	points := points + 1].

(((numSingleton ~= 0)  | (numVoids ~= 0)) & (numDoubleton <= 1)) ifFalse: [ NT := false ] 
		ifTrue: [ ((numClubs >= 3) & (numDiamonds >= 3) & (numHearts >= 3) & (numSpades >= 3 )) ifFalse: [ NT:= false ] ].
	
