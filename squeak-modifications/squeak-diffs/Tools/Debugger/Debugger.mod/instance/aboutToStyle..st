code pane
aboutToStyle: aStyler
	"This is a notification that aStyler is about to re-style its text.
	Set the classOrMetaClass in aStyler, so that identifiers
	will be resolved correctly.
	Answer true to allow styling to proceed, or false to veto the styling"
	
	self isModeStyleable ifFalse: [^false].
	aStyler 
		classOrMetaClass: self selectedClassOrMetaClass;
		sourceMap: self debuggerMap.
	^true