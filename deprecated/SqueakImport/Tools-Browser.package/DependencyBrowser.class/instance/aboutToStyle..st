contents
aboutToStyle: aStyler
	"This is a notification that aStyler is about to re-style its text.
	Set the classOrMetaClass in aStyler, so that identifiers
	will be resolved correctly.
	Answer true to allow styling to proceed, or false to veto the styling"
	| selectedClass |
	selectedClass := self classListSelection ifNil:[^false].
	self messageListSelection ifNil:[^false].
	aStyler classOrMetaClass: ((self messageListSelection == #Definition) ifFalse:[Smalltalk classNamed: selectedClass]).
	^true