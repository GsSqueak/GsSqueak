installing
size: pointSize fromLiteral: aString 
	"This method allows a font set to be captured as sourcecode in a subclass.
	The string literals will presumably be created by printing, eg,
		(FileStream readOnlyFileNamed: 'Palatino24.sf2') contentsOfEntireFile,
		and then pasting into a browser after a heading like, eg,
size24
	^ self size: 24 fromLiteral:
	'--unreadable binary data--'

	See the method installAsTextStyle to see how this can be used."

	"This method is old and for backward compatibility only.
	please use fontNamed:fromLiteral: instead."

	self flag: #bob.	"used in Alan's projects"
	^(StrikeFont new)
		name: self fontName , (pointSize < 10 
							ifTrue: ['0' , pointSize printString]
							ifFalse: [pointSize printString]);
		readFromStrike2Stream: ((RWBinaryOrTextStream with: aString)
					reset;
					binary);
		yourself