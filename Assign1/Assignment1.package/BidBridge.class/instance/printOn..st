Printing
printOn: aStream
"Creates the spaces for every line and player in order to print them on the stream"
|numSFE numSFEr1 numSFEr2 numSFEr3 numSFEr4 numSFN maxOfNS spaceFE spaceFE1 spaceFE2 spaceFE3 spaceFE4 spaceFN space1|
maxOfNS := northPlayer largestSuit max:southPlayer largestSuit.
numSFN := ((westPlayer largestSuit + 2 ) * 2) - 1. 
"Since the number 10 occupies two characters we deduct one required space from number of spcaces if the suit includes it"
numSFEr1 :=((maxOfNS + 2) * 2 )+(((westPlayer largestSuit - westPlayer numSpades)*2)).(wCards includes: '10S') ifTrue:[numSFEr1 := numSFEr1 - 1].
numSFEr2 :=((maxOfNS + 2) * 2 )+ (((westPlayer largestSuit - westPlayer numHearts)*2)). (wCards includes: '10H') ifTrue:[numSFEr2 := numSFEr2 - 1].
numSFEr3 :=((maxOfNS + 2) * 2 )+  (((westPlayer largestSuit - westPlayer numDiamonds)*2)).(wCards includes: '10D') ifTrue:[numSFEr3 := numSFEr3 - 1].
numSFEr4 :=((maxOfNS + 2) * 2 )+ (((westPlayer largestSuit - westPlayer numClubs)*2)). (wCards includes: '10C') ifTrue:[numSFEr4 := numSFEr4 - 1].
numSFE := (numSFN - 4) + (maxOfNS * 2 + 2).
spaceFE1 := ''.
spaceFE2 := ''.
spaceFE3 := ''.
spaceFE4 := ''.
spaceFE := ''.
spaceFN := ''.
space1 := ' '.
numSFEr1 - 1 timesRepeat: [ spaceFE1 := spaceFE1, ' '  ].
numSFEr2 - 1 timesRepeat: [ spaceFE2 := spaceFE2, ' '  ].
numSFEr3 - 1 timesRepeat: [ spaceFE3 := spaceFE3, ' '  ].
numSFEr4 - 1 timesRepeat: [ spaceFE4 := spaceFE4, ' '  ].
numSFE - 1 timesRepeat: [ spaceFE := spaceFE, ' '  ].
numSFN - 1 timesRepeat: [ spaceFN := spaceFN, ' '  ].

"Print North"
 aStream
		nextPutAll: spaceFN;nextPutAll:'NORTH';cr;nextPutAll: spaceFN;nextPutAll:'S'; flush.
		nCards do: [ :each | (each endsWith: 'S')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].
 aStream
		cr;nextPutAll: spaceFN;nextPutAll:'H'; flush.
		nCards do: [ :each | (each endsWith: 'H')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].		
 aStream
		cr;nextPutAll: spaceFN;nextPutAll:'D'; flush.
		nCards do: [ :each | (each endsWith: 'D')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].		
 aStream
		cr;nextPutAll: spaceFN;nextPutAll:'C'; flush.
		nCards do: [ :each | (each endsWith: 'C')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].	
"Priting West and East"
 aStream
		cr;nextPutAll:'WEST';nextPutAll: spaceFE;nextPutAll: 'EAST';cr;nextPutAll:'S'; flush.
		wCards do: [ :each | (each endsWith: 'S')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast;flush]].
aStream 
		nextPutAll: spaceFE1;nextPutAll:'S'; flush.
		eCards do: [ :each | (each endsWith: 'S')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast;flush]].
 aStream
		cr;nextPutAll:'H'; flush.
		wCards do: [ :each | (each endsWith: 'H')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast;flush]].	
aStream 
		nextPutAll: spaceFE2;nextPutAll:'H'; flush.
		eCards do: [ :each | (each endsWith: 'H')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].	
 aStream
		cr;nextPutAll:'D';flush.
		wCards do: [ :each | (each endsWith: 'D')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].	
aStream 
		nextPutAll: spaceFE3;nextPutAll:'D'; flush.
		eCards do: [ :each | (each endsWith: 'D')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].	
 aStream
		cr;nextPutAll:'C'; flush.
		wCards do: [ :each | (each endsWith: 'C')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].	
aStream 
		nextPutAll: spaceFE4;nextPutAll:'C';flush.
		eCards do: [ :each | (each endsWith: 'C')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].
"Print South"
 aStream
		cr;nextPutAll: spaceFN;nextPutAll:'SOUTH';cr;nextPutAll: spaceFN;nextPutAll:'S'; flush.
		sCards do: [ :each | (each endsWith: 'S')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].
 aStream
		cr;nextPutAll: spaceFN;nextPutAll:'H'; flush.
		sCards do: [ :each | (each endsWith: 'H')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].		
 aStream
		cr;nextPutAll: spaceFN;nextPutAll:'D'; flush.
		sCards do: [ :each | (each endsWith: 'D')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].		
 aStream
		cr;nextPutAll: spaceFN;nextPutAll:'C'; flush.
		sCards do: [ :each | (each endsWith: 'C')  ifTrue: [ aStream nextPutAll:space1;nextPutAll: each allButLast; flush]].	

"Printing State of Game"
aStream 
	cr; nextPutAll: 'SOUTH WEST NORTH EAST';flush.
"Loops of the game proces goes here"
aStream
	cr;nextPutAll: 'Declarer: '; flush.


