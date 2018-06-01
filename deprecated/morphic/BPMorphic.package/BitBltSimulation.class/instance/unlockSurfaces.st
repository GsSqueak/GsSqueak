surface support
unlockSurfaces
	"Unlock the bits of any OS surfaces."
	"See the comment in lockSurfaces. Similar rules apply. That is, the
	area provided in ioUnlockSurface can be used to determine the dirty
	region after drawing. If a source is unlocked, then the area will be
	(0,0,0,0) to indicate that no portion is dirty."
	| _gsSqueakTemp_sourceHandle _gsSqueakTemp_destHandle _gsSqueakTemp_destLocked _gsSqueakTemp_fn |
	<var: #fn declareC: 'sqInt (*fn)(sqInt, sqInt, sqInt, sqInt, sqInt)'>
	hasSurfaceLock
		ifTrue: [unlockSurfaceFn = 0
				ifTrue: [self loadSurfacePlugin
						ifFalse: [^ nil]].
			_gsSqueakTemp_fn := self cCoerce: unlockSurfaceFn to: 'sqInt (*)(sqInt, sqInt, sqInt, sqInt, sqInt)'.
			_gsSqueakTemp_destLocked := false.
			_gsSqueakTemp_destHandle := interpreterProxy fetchPointer: FormBitsIndex ofObject: destForm.
			(interpreterProxy isIntegerObject: _gsSqueakTemp_destHandle)
				ifTrue: [_gsSqueakTemp_destHandle := interpreterProxy integerValueOf: _gsSqueakTemp_destHandle.
					"The destBits are always assumed to be dirty"
					self cCode: 'fn(destHandle, affectedL, affectedT, affectedR-affectedL, affectedB-affectedT)'.
					destBits := destPitch := 0.
					_gsSqueakTemp_destLocked := true].
			noSource
				ifFalse: [_gsSqueakTemp_sourceHandle := interpreterProxy fetchPointer: FormBitsIndex ofObject: sourceForm.
					(interpreterProxy isIntegerObject: _gsSqueakTemp_sourceHandle)
						ifTrue: [_gsSqueakTemp_sourceHandle := interpreterProxy integerValueOf: _gsSqueakTemp_sourceHandle.
							"Only unlock sourceHandle if different from
							destHandle "
							(_gsSqueakTemp_destLocked
									and: [_gsSqueakTemp_sourceHandle = _gsSqueakTemp_destHandle])
								ifFalse: [self cCode: 'fn(sourceHandle, 0, 0, 0, 0)'].
							sourceBits := sourcePitch := 0]].
			hasSurfaceLock := false]