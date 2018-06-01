events-listening
addListener: anObject to: aListenerGroup 
	"Add anObject to the given listener group. Return the new group."
	| _gsSqueakTemp_listeners |
	_gsSqueakTemp_listeners := aListenerGroup.
	(_gsSqueakTemp_listeners notNil
			and: [_gsSqueakTemp_listeners includes: anObject])
		ifFalse: [_gsSqueakTemp_listeners
				ifNil: [_gsSqueakTemp_listeners := WeakArray with: anObject]
				ifNotNil: [_gsSqueakTemp_listeners := _gsSqueakTemp_listeners copyWith: anObject]].
	_gsSqueakTemp_listeners := _gsSqueakTemp_listeners copyWithout: nil.
	"obsolete entries"
	^ _gsSqueakTemp_listeners