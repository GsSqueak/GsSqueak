as yet unclassified
computeThumbnail
	"Assumption on entry:
	The receiver's width represents the maximum width allowable.
	The receiver's height represents the exact height desired."
	| _gsSqueakTemp_f _gsSqueakTemp_scaleX _gsSqueakTemp_scaleY |
	_gsSqueakTemp_f := morphRepresented imageForm.
	morphRepresented fullReleaseCachedState.
	_gsSqueakTemp_scaleY := self height / _gsSqueakTemp_f height.
	"keep height invariant"
	_gsSqueakTemp_scaleX := morphRepresented width * _gsSqueakTemp_scaleY <= self width
				ifTrue: [_gsSqueakTemp_scaleY
					"the usual case; same scale factor, to preserve aspect
					ratio "]
				ifFalse: [self width / _gsSqueakTemp_f width].
	self
		form: (_gsSqueakTemp_f
				magnify: _gsSqueakTemp_f boundingBox
				by: _gsSqueakTemp_scaleX @ _gsSqueakTemp_scaleY
				smoothing: 2).
	self extent: originalForm extent