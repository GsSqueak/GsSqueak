running
offerDialogMenu
	| _gsSqueakTemp_menu |
	_gsSqueakTemp_menu := MenuMorph new defaultTarget: self.
	_gsSqueakTemp_menu add: (exclusive == true
			ifTrue: ['<yes>']
			ifFalse: ['<no>'])
			, 'be modally exclusive' translated action: #toggleExclusive;
		 addLine;
		 add: 'explore dialog invocation' translated action: #exploreInvocation.
	_gsSqueakTemp_menu popUpEvent: self currentEvent in: self world.
	[_gsSqueakTemp_menu isInWorld]
		whileTrue: [self world doOneSubCycle].
	self exclusive
		ifTrue: [self activeHand newMouseFocus: self]