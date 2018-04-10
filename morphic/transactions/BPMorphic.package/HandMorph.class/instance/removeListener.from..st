events-listening
removeListener: anObject from: aListenerGroup 
	"Remove anObject from the given listener group. Return the new
	group. "
	| _gsSqueakTemp_listeners |
	aListenerGroup
		ifNil: [^ nil].
	_gsSqueakTemp_listeners := aListenerGroup.
	_gsSqueakTemp_listeners := _gsSqueakTemp_listeners copyWithout: anObject.
	_gsSqueakTemp_listeners := _gsSqueakTemp_listeners copyWithout: nil.
	"obsolete entries"
	_gsSqueakTemp_listeners isEmpty
		ifTrue: [_gsSqueakTemp_listeners := nil].
	^ _gsSqueakTemp_listeners