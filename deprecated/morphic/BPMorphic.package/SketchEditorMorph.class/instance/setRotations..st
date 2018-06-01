start & finish
setRotations: num 
	"Tell the palette what number of rotations (or background) to show. "
	| _gsSqueakTemp_key |
	_gsSqueakTemp_key := 'ItTurns'.
	"default and value for num > 1"
	num = 1
		ifTrue: [_gsSqueakTemp_key := 'JustAsIs'].
	num = 18
		ifTrue: [_gsSqueakTemp_key := 'ItTurns'].
	num = 99
		ifTrue: [_gsSqueakTemp_key := 'ToAndFro'].
	num == #Background
		ifTrue: [_gsSqueakTemp_key := 'Background'].
	num == #Repeated
		ifTrue: [_gsSqueakTemp_key := 'Repeated'].
	palette
		setRotations: (palette contentsAtKey: _gsSqueakTemp_key)