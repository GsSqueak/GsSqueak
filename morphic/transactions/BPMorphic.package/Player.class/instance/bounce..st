scripts-standard
bounce: soundName 
	"If the receiver's current bounds obtrude beyond the bounds of its
	container, then 'bounce' it back within the container, and make the
	indicated sound while doing so"
	| _gsSqueakTemp_box _gsSqueakTemp_bounced _gsSqueakTemp_aCostume |
	(_gsSqueakTemp_aCostume := self costume)
		ifNil: [^ self].
	(_gsSqueakTemp_aCostume owner isNil
			or: [_gsSqueakTemp_aCostume owner isHandMorph])
		ifTrue: [^ self].
	_gsSqueakTemp_box := _gsSqueakTemp_aCostume owner bounds.
	_gsSqueakTemp_bounced := false.
	_gsSqueakTemp_aCostume left < _gsSqueakTemp_box left
		ifTrue: [self headRight.
			_gsSqueakTemp_bounced := true].
	_gsSqueakTemp_aCostume right > _gsSqueakTemp_box right
		ifTrue: [self headLeft.
			_gsSqueakTemp_bounced := true].
	_gsSqueakTemp_aCostume top < _gsSqueakTemp_box top
		ifTrue: [self headDown.
			_gsSqueakTemp_bounced := true].
	_gsSqueakTemp_aCostume bottom > _gsSqueakTemp_box bottom
		ifTrue: [self headUp.
			_gsSqueakTemp_bounced := true].
	_gsSqueakTemp_bounced
		ifTrue: [^ self makeBounceSound: soundName]