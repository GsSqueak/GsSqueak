tablet drawing examples
feltTip: width cellSize: cellSize
	"Warning: This example potentially uses a large amount of memory--it creates a Form with cellSize squared bits for every Display pixel."
	"In this example, all drawing is done into a large, monochrome Form and then scaled down onto the Display using smoothing. The larger the cell size, the more possible shades of gray can be generated, and the smoother the resulting line appears. A cell size of 8 yields 64 possible grays, while a cell size of 16 gives 256 levels, which is about the maximum number of grays that the human visual system can distinguish. The width parameter determines the maximum line thickness. Requires the optional tablet support primitives which may not be supported on all platforms. Works best in full screen mode. Shift-mouse to exit." 
	"Pen feltTip: 2.7 cellSize: 8"

	| tabletScale bitForm pen warp |
	tabletScale := self tabletScaleFactor.
	bitForm := Form extent: Display extent * cellSize depth: 1.
	pen := Pen newOnForm: bitForm.
	pen color: Color black.
	warp := (WarpBlt toForm: Display)
		sourceForm: bitForm;
		colorMap: (bitForm colormapIfNeededFor: Display);
		cellSize: cellSize;
		combinationRule: Form over.
	Display fillColor: Color white.
	Display restoreAfter: [ | p r nibSize srcR startP dstR |
		[Sensor shiftPressed and: [Sensor anyButtonPressed]] whileFalse: [
			p := (Sensor tabletPoint * cellSize * tabletScale) rounded.
			nibSize := (Sensor tabletPressure * (cellSize * width)) rounded.
		     nibSize > 0
				ifTrue: [
					pen squareNib: nibSize.
					startP := pen location.
					pen goto: p.
					r := startP rect: pen location.
					dstR := (r origin // cellSize) corner: ((r corner + nibSize + (cellSize - 1)) // cellSize).
					srcR := (dstR origin * cellSize) corner: (dstR corner * cellSize).
					warp copyQuad: srcR innerCorners toRect: dstR]
				ifFalse: [
					pen place: p]]].
