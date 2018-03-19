accessing
scaleFactor
	"Answer the number representing my scaleFactor, assuming the
	receiver to be unflexed (if flexed, the renderer's scaleFactor is called
	instead "
	| _gsSqueakTemp_qty |
	(_gsSqueakTemp_qty := self scalePoint) isPoint
		ifTrue: [^ 1.0].
	^ _gsSqueakTemp_qty