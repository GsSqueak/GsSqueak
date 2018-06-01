drawing
imageForm: depth forRectangle: rect 
	| _gsSqueakTemp_canvas |
	_gsSqueakTemp_canvas := Display defaultCanvasClass extent: rect extent depth: depth.
	_gsSqueakTemp_canvas form fillColor: self color negated.
	_gsSqueakTemp_canvas
		translateBy: rect topLeft negated
		during: [:tempCanvas | tempCanvas fullDrawMorph: self].
	^ _gsSqueakTemp_canvas form offset: rect topLeft