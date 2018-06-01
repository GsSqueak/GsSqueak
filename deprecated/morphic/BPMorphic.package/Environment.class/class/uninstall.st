class initialization
uninstall
	| _gsSqueakTemp_globals _gsSqueakTemp_sysdict |
	self environment class == self
		ifFalse: [Transcript cr; show: 'Can''t uninstall environments; they''re not currently installed'.
			^ self].
	_gsSqueakTemp_globals := Smalltalk globals instVarNamed: 'contents'.
	_gsSqueakTemp_sysdict := SystemDictionary new: _gsSqueakTemp_globals size.
	_gsSqueakTemp_globals
		associationsDo: [:ea | _gsSqueakTemp_sysdict add: ea].
	Smalltalk globals becomeForward: _gsSqueakTemp_sysdict