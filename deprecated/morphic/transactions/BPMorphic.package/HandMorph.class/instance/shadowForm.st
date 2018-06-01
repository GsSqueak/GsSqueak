drawing
shadowForm
	"Return a 1-bit shadow of my submorphs. Assumes submorphs is not
	empty "
	| _gsSqueakTemp_bnds _gsSqueakTemp_canvas |
	_gsSqueakTemp_bnds := Rectangle
				merging: (submorphs
						collect: [:m | m fullBounds]).
	_gsSqueakTemp_canvas := (Display defaultCanvasClass extent: _gsSqueakTemp_bnds extent depth: 1)
				asShadowDrawingCanvas: Color black.
	_gsSqueakTemp_canvas
		translateBy: _gsSqueakTemp_bnds topLeft negated
		during: [:tempCanvas | self drawSubmorphsOn: tempCanvas].
	^ _gsSqueakTemp_canvas form offset: _gsSqueakTemp_bnds topLeft