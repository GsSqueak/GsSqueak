displaying
showPane
	owner ifNil: [
		| win |
		win := self window ifNil: [ ^self ].
		win addMorph: self fullFrame: self layoutFrame.
		win updatePanesFromSubmorphs ].

	self lowerPane ifNotNil: [ :lp | lp layoutFrame bottomFraction: self layoutFrame topFraction ].
	
	self window ifNotNil: [:win | win addPaneSplitters]