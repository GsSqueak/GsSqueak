drawing
drawInterpolatedImage: aForm on: aCanvas
	"Draw the given form onto the canvas using the Balloon 3D engine"
	| engine |
	engine := Smalltalk at: #B3DRenderEngine 
		ifPresent:[:b3d | b3d defaultForPlatformOn: aCanvas form].
	engine == nil ifTrue:[
		self useInterpolation: false.
		^self generateRotatedForm].
	"Setup the engine"
	engine viewport: aCanvas form boundingBox.
	"Install the material to be used (using a plain white emission color)"
	engine material: ((Smalltalk at: #B3DMaterial) new emission: Color white).
	"Install the texture"
	engine texture: aForm.
	"Draw the mesh"
	engine render: ((Smalltalk at: #B3DIndexedQuadMesh) new plainTextureRect).
	"and finish"
	engine finish.