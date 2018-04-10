identification
methodsWithInitials: targetInitials 
	"Based on a do-it contributed to the Squeak mailing list by Göran
	Hultgen: Browse methods whose initials (in the time-stamp, as logged
	to disk) match the given initials.
	Print out the complete time-stamp table to the Transcript.
	Answer a list of (initials -> count) associations.
	
	CAUTION: It may take several minutes for this to complete."
	"Time millisecondsToRun: [Utilities methodsWithInitials: 'bf']"
	| _gsSqueakTemp_initials _gsSqueakTemp_timeStamp _gsSqueakTemp_allSubmitters |
	_gsSqueakTemp_initials := ''.
	_gsSqueakTemp_timeStamp := ''.
	_gsSqueakTemp_allSubmitters := Bag new.
	self systemNavigation
		browseAllSelect: [:cm | 
			_gsSqueakTemp_timeStamp := cm timeStamp.
			_gsSqueakTemp_initials := _gsSqueakTemp_timeStamp isEmpty
						ifTrue: ['']
						ifFalse: [_gsSqueakTemp_timeStamp substrings first].
			_gsSqueakTemp_initials := _gsSqueakTemp_initials isEmpty
						ifTrue: ['<no time stamp>']
						ifFalse: [_gsSqueakTemp_initials first isDigit
								ifTrue: ['<date>']
								ifFalse: [_gsSqueakTemp_initials]].
			_gsSqueakTemp_allSubmitters add: _gsSqueakTemp_initials.
			_gsSqueakTemp_initials = targetInitials]
		name: 'Methods with initials ' , targetInitials
		autoSelect: nil.
	_gsSqueakTemp_allSubmitters sortedCounts
		do: [:elem | Transcript cr; show: elem asString].
	^ _gsSqueakTemp_allSubmitters