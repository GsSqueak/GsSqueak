-Etoys-utilities
holderWithAlphabet
	"Answer a fully instantiated Holder that has submorphs that represent
	the letters of the uppercase alphabet, with each one having an 'index'
	slot which bears the letter's index in the alphabet -- 1 for A, 2 for B,
	etc. A few special characters are provided as per ack request 10/00;
	for these the index provided is rather arbitrarily assigned"
	"ScriptingSystem holderWithAlphabet openInHand"
	| _gsSqueakTemp_aMorph _gsSqueakTemp_aPlayer _gsSqueakTemp_oneCharString _gsSqueakTemp_aContainer _gsSqueakTemp_aWrapper |
	_gsSqueakTemp_aContainer := self prototypicalHolder useRoundedCorners.
	_gsSqueakTemp_aContainer borderColor: Color blue lighter.
	_gsSqueakTemp_aWrapper := AlignmentMorph new hResizing: #shrinkWrap;
				 vResizing: #shrinkWrap;
				 layoutInset: 0.
	_gsSqueakTemp_aWrapper addMorphBack: (_gsSqueakTemp_aMorph := TextMorph new contents: 'A').
	_gsSqueakTemp_aMorph
		beAllFont: ((TextStyle named: Preferences standardEToysFont familyName)
				fontOfSize: 24).
	_gsSqueakTemp_aMorph width: 14;
		 lock.
	_gsSqueakTemp_aWrapper beTransparent; setNameTo: 'A'.
	_gsSqueakTemp_aPlayer := _gsSqueakTemp_aWrapper assuredPlayer.
	_gsSqueakTemp_aPlayer
		addInstanceVariableNamed: #index
		type: #Number
		value: 1.
	_gsSqueakTemp_aContainer addMorphBack: _gsSqueakTemp_aWrapper.
	2
		to: 26
		do: [:anIndex | 
			| newMorph |
			newMorph := _gsSqueakTemp_aWrapper usableSiblingInstance.
			newMorph player perform: #setIndex: with: anIndex.
			newMorph firstSubmorph contents: (_gsSqueakTemp_oneCharString := ($A asciiValue + anIndex - 1) asCharacter asString).
			newMorph setNameTo: _gsSqueakTemp_oneCharString.
			_gsSqueakTemp_aContainer addMorphBack: newMorph].
	#(' ' '.' '#' )
		with: #(27 28 29 )
		do: [:aString :anIndex | 
			| newMorph |
			newMorph := _gsSqueakTemp_aWrapper usableSiblingInstance.
			newMorph player perform: #setIndex: with: anIndex.
			newMorph firstSubmorph contents: aString.
			aString = ' '
				ifTrue: [newMorph setNameTo: 'space'.
					newMorph
						color: (Color gray alpha: 0.2)]
				ifFalse: [newMorph setNameTo: aString].
			_gsSqueakTemp_aContainer addMorphBack: newMorph].
	_gsSqueakTemp_aContainer setNameTo: 'alphabet'.
	_gsSqueakTemp_aContainer isPartsBin: true.
	_gsSqueakTemp_aContainer enableDrop: false.
	_gsSqueakTemp_aContainer indicateCursor: false;
		 width: 162.
	_gsSqueakTemp_aContainer
		color: (Color
				r: 0.839
				g: 1.0
				b: 1.0).
	"Color fromUser"
	^ _gsSqueakTemp_aContainer