drawing
safeProjectName: aString 
	self addProjectNameMorphFiller.
	self isTheRealProjectPresent ifFalse: [^self].
	project renameTo: aString.
	self setProperty: #SafeProjectName toValue: project name.
	self updateNamePosition.
	(owner isSystemWindow) ifTrue: [owner setLabel: aString]