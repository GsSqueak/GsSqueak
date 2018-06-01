images
createBoxOfSize: anInteger color: aColor 
	"PRIVATE - create a box with anInteger and aColor 
	
	Try with: 
	(ScrollBar createBoxOfSize: 32 color: Color gray) asMorph 
	openInHand. 
	"
	| _gsSqueakTemp_form _gsSqueakTemp_canvas _gsSqueakTemp_margin |
	_gsSqueakTemp_form := Form extent: anInteger asPoint depth: 32.
	_gsSqueakTemp_canvas := _gsSqueakTemp_form getCanvas.
	_gsSqueakTemp_margin := anInteger < 14
				ifTrue: [3]
				ifFalse: [4].
	"Preferences gradientScrollBars
	ifTrue: [
	fillStyle := GradientFillStyle ramp: {
	0.0 -> (aColor adjustBrightness: 0.5).
	0.1-> (aColor adjustBrightness: 0.05).
	0.6 -> (aColor darker)}.
	fillStyle origin: margin asPoint.
	fillStyle direction: anInteger @ 0]
	ifFalse: [
	fillStyle := SolidFillStyle color: aColor]."
	_gsSqueakTemp_canvas
		fillRectangle: ((0 @ 0 extent: anInteger asPoint)
				insetBy: _gsSqueakTemp_margin)
		fillStyle: (SolidFillStyle color: aColor).
	^ _gsSqueakTemp_form