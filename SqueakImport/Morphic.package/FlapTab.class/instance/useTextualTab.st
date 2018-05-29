textual tabs
useTextualTab
	| stringToUse colorToUse |
	self preserveDetails.
	colorToUse := self valueOfProperty: #priorColor ifAbsent: [Color green muchLighter].
	submorphs notEmpty ifTrue: [self removeAllMorphs].
	stringToUse := self valueOfProperty: #priorWording ifAbsent: ['Unnamed Flap' translated].
	self assumeString: stringToUse font:  Preferences standardFlapFont orientation: self orientation color: colorToUse