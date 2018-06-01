running
offerDialogMenu

	| menu |
	menu := MenuMorph new defaultTarget: self.
	menu
		add: (exclusive == true ifTrue: ['<yes>'] ifFalse: ['<no>']), 'be modally exclusive' translated
		action: #toggleExclusive;
		addLine;
		add: 'explore dialog invocation' translated
		action: #exploreInvocation.
		
	menu popUpEvent: self currentEvent in: self world.
	
	[menu isInWorld] whileTrue: [self world doOneSubCycle].
	self exclusive ifTrue: [self activeHand newMouseFocus: self].