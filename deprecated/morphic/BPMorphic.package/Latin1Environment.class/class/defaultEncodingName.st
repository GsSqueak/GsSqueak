subclass responsibilities
defaultEncodingName
	| _gsSqueakTemp_platformName _gsSqueakTemp_osVersion |
	_gsSqueakTemp_platformName := Smalltalk platformName.
	_gsSqueakTemp_osVersion := Smalltalk osVersion.
	(_gsSqueakTemp_platformName = 'Win32'
			and: [_gsSqueakTemp_osVersion = 'CE'])
		ifTrue: [^ 'utf-8' copy].
	(#('Win32' 'Mac OS' 'ZaurusOS' ) includes: _gsSqueakTemp_platformName)
		ifTrue: [^ 'iso8859-1' copy].
	(#('unix' ) includes: _gsSqueakTemp_platformName)
		ifTrue: [^ 'iso8859-1' copy].
	^ 'mac-roman'