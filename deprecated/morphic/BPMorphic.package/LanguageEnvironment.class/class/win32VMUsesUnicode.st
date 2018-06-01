private
win32VMUsesUnicode
	| _gsSqueakTemp_buildDate _gsSqueakTemp_ind _gsSqueakTemp_date _gsSqueakTemp_vmHead |
	_gsSqueakTemp_vmHead := Smalltalk vmVersion.
	_gsSqueakTemp_vmHead
		ifNil: [^ false"LanguageEnvironment win32VMUsesUnicode"].
	_gsSqueakTemp_buildDate := Smalltalk buildDate.
	_gsSqueakTemp_buildDate
		ifNil: [^ false"LanguageEnvironment win32VMUsesUnicode"].
	_gsSqueakTemp_ind := _gsSqueakTemp_buildDate indexOfSubCollection: 'on'.
	_gsSqueakTemp_date := Date
				readFromString: (_gsSqueakTemp_buildDate copyFrom: _gsSqueakTemp_ind + 3 to: _gsSqueakTemp_buildDate size).
	(_gsSqueakTemp_vmHead beginsWith: 'Croquet')
		ifTrue: [^ _gsSqueakTemp_date
				>= (Date readFromString: '1 Feb 2007')].
	(_gsSqueakTemp_vmHead beginsWith: 'Squeak')
		ifTrue: [^ _gsSqueakTemp_date
				>= (Date readFromString: '5 June 2007')].
	^ false"LanguageEnvironment win32VMUsesUnicode"