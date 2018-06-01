displaying
displayResourceFormOn: aForm
	"a special display method for blowing up resource thumbnails"
	| engine tx cmap blitter |
	self extent = aForm extent ifTrue:[^self displayOn: aForm].
	engine := Smalltalk at: #B3DRenderEngine ifPresent:
		[:engineClass | engineClass defaultForPlatformOn: aForm].
	engine ifNil:[
		"We've got no bilinear interpolation. Use WarpBlt instead"
		(WarpBlt toForm: aForm)
			sourceForm: self destRect: aForm boundingBox;
			combinationRule: 3;
			cellSize: 2;
			warpBits.
		^self
	].
	tx := self asTexture.
	(blitter := BitBlt toForm: tx)
		sourceForm: self; destRect: aForm boundingBox;
		sourceOrigin: 0@0;
		combinationRule: Form paint.
	"map transparency to current World background color"
	(Project current world color respondsTo: #pixelWordForDepth:) ifTrue: [
		cmap := Bitmap new: (self depth <= 8 ifTrue: [1 << self depth] ifFalse: [4096]).
		cmap at: 1 put: (tx pixelWordFor: Project current world color).
		blitter colorMap: cmap.
	].
	blitter copyBits.
	engine viewport: aForm boundingBox.
	engine material: ((Smalltalk at: #B3DMaterial) new emission: Color white).
	engine texture: tx.
	engine render: ((Smalltalk at: #B3DIndexedQuadMesh) new plainTextureRect).
	engine finish.
	"the above, using bilinear interpolation doesn't leave transparent pixel values intact"
	(WarpBlt toForm: aForm)
		sourceForm: self destRect: aForm boundingBox;
		combinationRule: Form and;
		colorMap: (Color maskingMap: self depth);
		warpBits.