submorphs-add/remove
addMorphNearBack: aMorph 
	| bg |
	(submorphs notEmpty
			and: [submorphs last mustBeBackmost])
		ifTrue: [bg := submorphs last.
			bg privateDelete].
	self addMorphBack: aMorph.
	bg
		ifNotNil: [self addMorphBack: bg]