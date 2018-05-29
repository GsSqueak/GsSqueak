displaying
hidePane
	| win |
	self window ifNotNil: [:window | window removePaneSplitters].
	
	self lowerPane ifNotNil:
		[ :lp | 
		lp layoutFrame bottomFraction: self layoutFrame bottomFraction.
		lp layoutFrame bottomOffset: SystemWindow borderWidth negated].
	win := self window ifNil: [ ^self ].
	self delete.
	win updatePanesFromSubmorphs.
	win addPaneSplitters