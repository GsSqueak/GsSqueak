instance creations
addFromTTFile: fileName
"
	Execute the following only if you know what you are doing.
	self addFromTTFile: 'C:\WINDOWS\Fonts\msgothic.TTC'
"

	| tt |
	(fileName asLowercase endsWith: 'ttf') ifTrue: [
		tt := TTCFontReader readTTFFrom: (FileStream readOnlyFileNamed: fileName).
	] ifFalse: [
		tt := TTCFontReader readFrom: (FileStream readOnlyFileNamed: fileName).
	].

	self addToDescription: tt.
	^ tt.
