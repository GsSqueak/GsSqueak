subclass responsibilities
systemConverterClass
	| _gsSqueakTemp_platformName _gsSqueakTemp_osVersion |
	_gsSqueakTemp_platformName := Smalltalk platformName.
	_gsSqueakTemp_osVersion := Smalltalk getSystemAttribute: 1002.
	(_gsSqueakTemp_platformName = 'Win32'
			and: [_gsSqueakTemp_osVersion = 'CE'])
		ifTrue: [^ MacRomanTextConverter].
	_gsSqueakTemp_platformName = 'Win32'
		ifTrue: [^ self win32VMUsesUnicode
				ifTrue: [UTF8TextConverter]
				ifFalse: [Latin1TextConverter]].
	_gsSqueakTemp_platformName = 'Mac OS'
		ifTrue: [^ ('10*' match: Smalltalk osVersion)
				ifTrue: [UTF8TextConverter]
				ifFalse: [MacRomanTextConverter]].
	_gsSqueakTemp_platformName = 'unix'
		ifTrue: [^ UTF8TextConverter].
	^ MacRomanTextConverter