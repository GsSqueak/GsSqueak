scripts-standard
loadSound: soundName 
	| _gsSqueakTemp_snd |
	_gsSqueakTemp_snd := SoundService default soundNamed: soundName.
	_gsSqueakTemp_snd
		ifNotNil: [self sendMessageToCostume: #loadSound: with: _gsSqueakTemp_snd]