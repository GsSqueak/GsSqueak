access
acquirePlausibleFlapID
	"Give the receiver a flapID that is globally unique; try to hit the mark
	vis a vis the standard system flap id's, for the case when this method
	is invoked as part of the one-time transition"
	| _gsSqueakTemp_wording |
	_gsSqueakTemp_wording := self wording.
	(_gsSqueakTemp_wording isEmpty
			or: [_gsSqueakTemp_wording = '---'])
		ifTrue: [_gsSqueakTemp_wording := 'Flap' translated].
	^ self provideDefaultFlapIDBasedOn: _gsSqueakTemp_wording