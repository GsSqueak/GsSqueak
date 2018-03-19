-Etoys-support
firedMouseUpCode
	"If the user has special mouseUpCodeToRun, then fire it once right
	now and return true, else return false"
	| _gsSqueakTemp_evt |
	(self world isNil
			or: [self mouseUpCodeOrNil isNil])
		ifTrue: [^ false].
	_gsSqueakTemp_evt := MouseEvent new
				setType: nil
				position: self center
				buttons: 0
				hand: self world activeHand.
	self programmedMouseUp: _gsSqueakTemp_evt for: self.
	^ true