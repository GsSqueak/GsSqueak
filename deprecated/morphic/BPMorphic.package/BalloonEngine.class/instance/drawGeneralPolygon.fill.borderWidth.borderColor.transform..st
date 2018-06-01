drawing
drawGeneralPolygon: contours fill: fillStyle borderWidth: borderWidth borderColor: borderFill transform: aTransform 
	| _gsSqueakTemp_fills |
	self edgeTransform: aTransform.
	self resetIfNeeded.
	_gsSqueakTemp_fills := self registerFill: fillStyle and: borderFill.
	contours
		do: [:points | 
			self
				primAddPolygon: points
				segments: points size
				fill: (_gsSqueakTemp_fills at: 1)
				lineWidth: borderWidth
				lineFill: (_gsSqueakTemp_fills at: 2).
			"Note: To avoid premature flushing of the pipeline we need to
			reset the flush bit within the engine."
			self primFlushNeeded: false].
	"And set the flush bit afterwards"
	self primFlushNeeded: true.
	self postFlushIfNeeded