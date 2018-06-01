displaying
aaFirstPixelFrom: leftX to: rightX 
	"Common function to compute the first full pixel for AA drawing"
	| _gsSqueakTemp_firstPixel |
	_gsSqueakTemp_firstPixel := leftX + self aaLevelGet - 1 bitAnd: (self aaLevelGet - 1) bitInvert32.
	_gsSqueakTemp_firstPixel > rightX
		ifTrue: [^ rightX]
		ifFalse: [^ _gsSqueakTemp_firstPixel]