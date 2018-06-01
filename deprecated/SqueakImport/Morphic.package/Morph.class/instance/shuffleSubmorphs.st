submorphs-accessing
shuffleSubmorphs
	"Randomly shuffle the order of my submorphs.  Don't call this method lightly!"

	| bg |
	self invalidRect: self fullBounds.
	(submorphs notEmpty and: [submorphs last mustBeBackmost]) 
		ifTrue: 
			[bg := submorphs last.
			bg privateDelete].
	submorphs := submorphs shuffled.
	bg ifNotNil: [self addMorphBack: bg].
	self layoutChanged