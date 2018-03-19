-Etoys
actorState
	"This method instantiates actorState as a side-effect.
	For simple queries, use actorStateOrNil"
	| _gsSqueakTemp_state |
	_gsSqueakTemp_state := self actorStateOrNil.
	_gsSqueakTemp_state
		ifNil: [_gsSqueakTemp_state := ActorState new initializeFor: self assuredPlayer.
			self actorState: _gsSqueakTemp_state].
	^ _gsSqueakTemp_state