private
win32VMUsesUnicode
	| buildDate ind date vmHead |
	vmHead := Smalltalk vmVersion.
	vmHead ifNil: [^ false].
	buildDate := Smalltalk buildDate.
	buildDate ifNil: [^ false].
	ind := buildDate indexOfSubCollection: 'on'.
	date := Date readFromString: (buildDate copyFrom: ind+3 to: buildDate size).
	(vmHead beginsWith: 'Croquet') ifTrue: [
		^ date >= (Date readFromString: '1 Feb 2007')
	].
	(vmHead beginsWith: 'Squeak') ifTrue: [
		^ date >= (Date readFromString: '5 June 2007')
	].
	^ false.

"LanguageEnvironment win32VMUsesUnicode"