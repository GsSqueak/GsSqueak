fills-gradient
loadGradientFill: rampOop from: point1 along: point2 normal: point3 isRadial: isRadial 
	"Load the gradient fill as defined by the color ramp."
	| _gsSqueakTemp_rampWidth _gsSqueakTemp_fill |
	(interpreterProxy fetchClassOf: rampOop)
			= interpreterProxy classBitmap
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_rampWidth := interpreterProxy slotSizeOf: rampOop.
	_gsSqueakTemp_fill := self
				allocateGradientFill: (interpreterProxy firstIndexableField: rampOop)
				rampWidth: _gsSqueakTemp_rampWidth
				isRadial: isRadial.
	engineStopped
		ifTrue: [^ nil].
	self
		loadFillOrientation: _gsSqueakTemp_fill
		from: point1
		along: point2
		normal: point3
		width: _gsSqueakTemp_rampWidth
		height: _gsSqueakTemp_rampWidth.
	^ _gsSqueakTemp_fill