I/O primitive support
updateDisplayLeft: l Top: t Right: r Bottom: b 
	"Repaint the portion of the Smalltalk screen bounded by the affected
	rectangle. Used to synchronize the screen after a Bitblt to the
	Smalltalk Display object."
	| _gsSqueakTemp_left _gsSqueakTemp_right _gsSqueakTemp_top _gsSqueakTemp_bottom _gsSqueakTemp_surfaceHandle |
	_gsSqueakTemp_left := l max: 0.
	_gsSqueakTemp_right := r min: displayWidth.
	_gsSqueakTemp_top := t max: 0.
	_gsSqueakTemp_bottom := b min: displayHeight.
	(_gsSqueakTemp_left <= _gsSqueakTemp_right
			and: [_gsSqueakTemp_top <= _gsSqueakTemp_bottom])
		ifFalse: [^ nil].
	(objectMemory isIntegerObject: displayBits asInteger)
		ifTrue: [_gsSqueakTemp_surfaceHandle := objectMemory integerValueOf: displayBits asInteger.
			showSurfaceFn = 0
				ifTrue: [showSurfaceFn := self ioLoadFunction: 'ioShowSurface' From: 'SurfacePlugin'.
					showSurfaceFn = 0
						ifTrue: [^ self primitiveFailFor: PrimErrNotFound]].
			self
				show: _gsSqueakTemp_surfaceHandle
				Sur: _gsSqueakTemp_left
				fa: _gsSqueakTemp_top
				ce: _gsSqueakTemp_right - _gsSqueakTemp_left
				Fn: _gsSqueakTemp_bottom - _gsSqueakTemp_top]
		ifFalse: [self
				assert: (objectMemory isNonImmediate: displayBits asInteger).
			self
				ioShow: displayBits asInteger
				D: displayWidth
				i: displayHeight
				s: displayDepth
				p: _gsSqueakTemp_left
				l: _gsSqueakTemp_right
				a: _gsSqueakTemp_top
				y: _gsSqueakTemp_bottom]