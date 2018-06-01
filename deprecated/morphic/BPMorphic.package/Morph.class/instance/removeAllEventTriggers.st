-Etoys-customevents-scripting
removeAllEventTriggers
	"Remove all the event registrations for my Player.
	User custom events are triggered at the World,
	while system custom events are triggered on individual Morphs."
	| _gsSqueakTemp_player |
	(_gsSqueakTemp_player := self player)
		ifNil: [^ self].
	self removeAllEventTriggersFor: _gsSqueakTemp_player.
	self currentWorld removeAllEventTriggersFor: _gsSqueakTemp_player