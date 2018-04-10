displaying
displayInterpolatedOn: aForm 
	"Display the receiver on aForm, using interpolation if necessary.
	Form fromUser displayInterpolatedOn: Display.
	Note: When scaling we attempt to use bilinear interpolation based
	on the 3D engine. If the engine is not there then we use WarpBlt.
	"
	| engine |
	self extent = aForm extent
		ifTrue: [^ self displayOn: aForm].
	engine := Smalltalk
				at: #B3DRenderEngine
				ifPresent: [:engineClass | engineClass defaultForPlatformOn: aForm].
	engine
		ifNil: ["We've got no bilinear interpolation. Use WarpBlt instead"
			(WarpBlt toForm: aForm) sourceForm: self destRect: aForm boundingBox;
				 combinationRule: 3;
				 cellSize: 2;
				 warpBits.
			^ self].
	"Otherwise use the 3D engine for our purposes"
	engine viewport: aForm boundingBox.
	engine
		material: ((Smalltalk at: #B3DMaterial) new emission: Color white).
	engine texture: self.
	engine render: (Smalltalk at: #B3DIndexedQuadMesh) new plainTextureRect.
	engine finish