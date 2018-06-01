drawing
drawInterpolatedImage: aForm on: aCanvas 
	"Draw the given form onto the canvas using the Balloon 3D engine"
	| _gsSqueakTemp_engine |
	_gsSqueakTemp_engine := Smalltalk
				at: #B3DRenderEngine
				ifPresent: [:b3d | b3d defaultForPlatformOn: aCanvas form].
	_gsSqueakTemp_engine == nil
		ifTrue: [self useInterpolation: false.
			^ self generateRotatedForm].
	"Setup the engine"
	_gsSqueakTemp_engine viewport: aCanvas form boundingBox.
	"Install the material to be used (using a plain white emission color)"
	_gsSqueakTemp_engine
		material: ((Smalltalk at: #B3DMaterial) new emission: Color white).
	"Install the texture"
	_gsSqueakTemp_engine texture: aForm.
	"Draw the mesh"
	_gsSqueakTemp_engine render: (Smalltalk at: #B3DIndexedQuadMesh) new plainTextureRect.
	"and finish"
	_gsSqueakTemp_engine finish