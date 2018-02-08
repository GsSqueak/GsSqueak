drawing
updateCacheCanvas: aCanvas 
	"Update the cached image of the morphs being held by this hand."
	"Note: The following is an attempt to quickly get out if there's no
	change "
	| _gsSqueakTemp_subBnds _gsSqueakTemp_rectList _gsSqueakTemp_nPix |
	_gsSqueakTemp_subBnds := Rectangle
				merging: (submorphs
						collect: [:m | m fullBounds]).
	_gsSqueakTemp_rectList := damageRecorder invalidRectsFullBounds: _gsSqueakTemp_subBnds.
	damageRecorder reset.
	(_gsSqueakTemp_rectList isEmpty
			and: [cacheCanvas notNil
					and: [cacheCanvas extent = _gsSqueakTemp_subBnds extent]])
		ifTrue: [^ self].
	"Always check for real translucency -- can't be cached in a form"
	self
		submorphsDo: [:m | m wantsToBeCachedByHand
				ifFalse: [cacheCanvas := nil.
					cachedCanvasHasHoles := true.
					^ self]].
	(cacheCanvas isNil
			or: [cacheCanvas extent ~= _gsSqueakTemp_subBnds extent])
		ifTrue: [cacheCanvas := (aCanvas allocateForm: _gsSqueakTemp_subBnds extent) getCanvas.
			cacheCanvas
				translateBy: _gsSqueakTemp_subBnds origin negated
				during: [:tempCanvas | self drawSubmorphsOn: tempCanvas].
			self
				submorphsDo: [:m | (m areasRemainingToFill: _gsSqueakTemp_subBnds) isEmpty
						ifTrue: [^ cachedCanvasHasHoles := false]].
			_gsSqueakTemp_nPix := cacheCanvas form tallyPixelValues first.
			"--> begin rounded corners hack <---"
			cachedCanvasHasHoles := (_gsSqueakTemp_nPix = 48
							and: [submorphs size = 1
									and: [submorphs first wantsRoundedCorners]])
						ifTrue: [false]
						ifFalse: [_gsSqueakTemp_nPix > 0].
			"--> end rounded corners hack <---"
			^ self].
	"incrementally update the cache canvas"
	cacheCanvas
		translateBy: _gsSqueakTemp_subBnds origin negated
		during: [:cc | _gsSqueakTemp_rectList
				do: [:r | cc
						clipBy: r
						during: [:c | 
							c fillColor: Color transparent.
							self drawSubmorphsOn: c]]]