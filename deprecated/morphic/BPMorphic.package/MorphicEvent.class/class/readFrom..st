instance creation
readFrom: aStream 
	"Read a MorphicEvent from the given stream."
	| _gsSqueakTemp_typeString |
	_gsSqueakTemp_typeString := String
				streamContents: [:s | | c | [(c := aStream next) isLetter]
						whileTrue: [s nextPut: c]].
	_gsSqueakTemp_typeString = 'mouseMove'
		ifTrue: [^ MouseMoveEvent type: #mouseMove readFrom: aStream].
	_gsSqueakTemp_typeString = 'mouseDown'
		ifTrue: [^ MouseButtonEvent type: #mouseDown readFrom: aStream].
	_gsSqueakTemp_typeString = 'mouseUp'
		ifTrue: [^ MouseButtonEvent type: #mouseUp readFrom: aStream].
	_gsSqueakTemp_typeString = 'mouseWheel'
		ifTrue: [^ MouseWheelEvent type: #mouseWheel readFrom: aStream].
	_gsSqueakTemp_typeString = 'keystroke'
		ifTrue: [^ KeyboardEvent type: #keystroke readFrom: aStream].
	_gsSqueakTemp_typeString = 'keyDown'
		ifTrue: [^ KeyboardEvent type: #keyDown readFrom: aStream].
	_gsSqueakTemp_typeString = 'keyUp'
		ifTrue: [^ KeyboardEvent type: #keyUp readFrom: aStream].
	_gsSqueakTemp_typeString = 'mouseOver'
		ifTrue: [^ MouseEvent type: #mouseOver readFrom: aStream].
	_gsSqueakTemp_typeString = 'mouseEnter'
		ifTrue: [^ MouseEvent type: #mouseEnter readFrom: aStream].
	_gsSqueakTemp_typeString = 'mouseLeave'
		ifTrue: [^ MouseEvent type: #mouseLeave readFrom: aStream].
	_gsSqueakTemp_typeString = 'unknown'
		ifTrue: [^ MorphicUnknownEvent type: #unknown readFrom: aStream].
	^ nil