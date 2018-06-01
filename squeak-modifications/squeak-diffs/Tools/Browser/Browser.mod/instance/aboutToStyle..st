code pane
aboutToStyle: aStyler
	"This is a notification that aStyler is about to re-style its text.
	Set the classOrMetaClass in aStyler, so that identifiers
	will be resolved correctly.
	Answer true to allow styling to proceed, or false to veto the styling"
	| type |
	
	self isModeStyleable ifFalse: [^false].
	type := self editSelection.
	(#(newMessage editMessage editClass newClass) includes: type) ifFalse:[^false].
	aStyler classOrMetaClass: ((type = #editClass or: [type = #newClass]) ifFalse:[self selectedClassOrMetaClass]).
	^true