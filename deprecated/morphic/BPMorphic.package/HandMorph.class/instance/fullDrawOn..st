drawing
fullDrawOn: aCanvas 
	"A HandMorph has unusual drawing requirements:
	1. the hand itself (i.e., the cursor) appears in front of its submorphs
	2. morphs being held by the hand cast a shadow on the
	world/morphs below
	The illusion is that the hand plucks up morphs and carries them
	above the world."
	"Note: This version caches an image of the morphs being held by the
	hand for
	better performance. This cache is invalidated if one of those morphs
	changes. "
	| _gsSqueakTemp_disableCaching _gsSqueakTemp_subBnds |
	self visible
		ifFalse: [^ self].
	(aCanvas isVisible: self fullBounds)
		ifFalse: [^ self].
	(self hasProperty: #errorOnDraw)
		ifTrue: [^ self drawErrorOn: aCanvas].
	_gsSqueakTemp_disableCaching := false.
	_gsSqueakTemp_disableCaching
		ifTrue: [self nonCachingFullDrawOn: aCanvas.
			^ self].
	submorphs isEmpty
		ifTrue: [cacheCanvas := nil.
			^ self drawOn: aCanvas].
	"just draw the hand itself"
	"special handling of a single submorph that wants to do its own thing
	when being dragged"
	(submorphs size = 1
			and: [submorphs first handledOwnDraggingBy: self on: aCanvas])
		ifTrue: [^ self drawOn: aCanvas].
	_gsSqueakTemp_subBnds := Rectangle
				merging: (submorphs
						collect: [:m | m fullBounds]).
	self updateCacheCanvas: aCanvas.
	(cacheCanvas isNil
			or: [cachedCanvasHasHoles
					and: [cacheCanvas depth = 1]])
		ifTrue: ["could not use caching due to translucency; do full draw"
			self nonCachingFullDrawOn: aCanvas.
			^ self].
	"draw the shadow"
	aCanvas asShadowDrawingCanvas
		translateBy: self shadowOffset
		during: [:shadowCanvas | cachedCanvasHasHoles
				ifTrue: ["Have to draw the real shadow of the form"
					shadowCanvas paintImage: cacheCanvas form at: _gsSqueakTemp_subBnds origin]
				ifFalse: ["Much faster if only have to shade the edge of a solid
					rectangle "
					(_gsSqueakTemp_subBnds
						areasOutside: (_gsSqueakTemp_subBnds translateBy: self shadowOffset negated))
						do: [:r | shadowCanvas fillRectangle: r color: Color black]]].
	"draw morphs in front of the shadow using the cached Form"
	cachedCanvasHasHoles
		ifTrue: [aCanvas paintImage: cacheCanvas form at: _gsSqueakTemp_subBnds origin]
		ifFalse: [aCanvas
				drawImage: cacheCanvas form
				at: _gsSqueakTemp_subBnds origin
				sourceRect: cacheCanvas form boundingBox].
	self drawOn: aCanvas
	"draw the hand itself in front of morphs"