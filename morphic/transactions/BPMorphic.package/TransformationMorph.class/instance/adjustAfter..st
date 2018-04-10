private
adjustAfter: changeBlock 
	"Cause this morph to remain cetered where it was before, and
	choose appropriate smoothing, after a change of scale or rotation."
	| _gsSqueakTemp_oldRefPos |
	_gsSqueakTemp_oldRefPos := self referencePosition.
	changeBlock value.
	self chooseSmoothing.
	self actorStateOrNil
		ifNotNil: [self
				penUpWhile: [self position: self position + (_gsSqueakTemp_oldRefPos - self referencePosition)]].
	self layoutChanged.
	owner
		ifNotNil: [owner invalidRect: bounds]