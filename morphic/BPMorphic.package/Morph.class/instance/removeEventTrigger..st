-Etoys-customevents-scripting
removeEventTrigger: aSymbol 
	"Remove all the event registrations for my Player that are triggered by
	aSymbol. User custom events are triggered at the World,
	while system custom events are triggered on individual Morphs."
	| _gsSqueakTemp_player |
	(_gsSqueakTemp_player := self player)
		ifNil: [^ self].
	self removeEventTrigger: aSymbol for: _gsSqueakTemp_player.
	self currentWorld removeEventTrigger: aSymbol for: _gsSqueakTemp_player