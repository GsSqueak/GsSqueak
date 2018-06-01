initialization
buildAPrototype
	| onImage |
	self initialize.
	self image: self class paletteImage.
	rotationTabForm := self class rotationTabImage.
	scaleTabForm := self class scaleTabImage.
	(colorMemoryThin := self class colorMemoryThinImage asMorph)
		setNamePropertyTo: 'ColorPickerClosed';
		position: self position + (11@150);
		on: #mouseEnter send: #showColorPalette: to: self.
	self addMorph: colorMemoryThin.
	(colorMemory := PaintBoxColorPicker new image: self class colorMemoryImage)
		setNamePropertyTo: 'ColorPickerOpened';
		on: #mouseDown send: #takeColorEvt:from: to: self.
	currentColor := Color black.
	
	onImage := self class paletteOnImage.
	self
		addToolsOffImage: image onImage: onImage;
		addBrushesOffImage: image;
		addActionsOffImage: image onImage: onImage;
		addStampsAndShapes;
		addShapeButtonsOffImage: self class shapesImage onImage: self class shapesOnImage;
		addStampButtonsOffImage: self class stampsImage onImage: self class stampsOnImage.
	stampHolder := ScrollingToolHolder newPrototypeFor: self.