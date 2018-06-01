drawing
updateImageFrom: sourceForm

	(WarpBlt toForm: image)
		sourceForm: sourceForm;
		cellSize: 2;  "installs a colormap"
		combinationRule: Form over;
		copyQuad: (sourceForm boundingBox) innerCorners
		toRect: image boundingBox.
