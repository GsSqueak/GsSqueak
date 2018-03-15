subclass responsibilities
inputInterpreterClass
	| _gsSqueakTemp_platformName _gsSqueakTemp_osVersion |
	_gsSqueakTemp_platformName := Smalltalk platformName.
	_gsSqueakTemp_osVersion := Smalltalk osVersion.
	(_gsSqueakTemp_platformName = 'Win32'
			and: [_gsSqueakTemp_osVersion ~= 'CE'])
		ifTrue: [^ self win32VMUsesUnicode
				ifTrue: [UTF32InputInterpreter]
				ifFalse: [MacRomanInputInterpreter]].
	_gsSqueakTemp_platformName = 'Mac OS'
		ifTrue: [^ MacUnicodeInputInterpreter].
	_gsSqueakTemp_platformName = 'unix'
		ifTrue: [^ UTF32InputInterpreter].
	^ MacUnicodeInputInterpreter