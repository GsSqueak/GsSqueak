operations
fill: drawBlock color: color
	| region tileForm tilePen shape saveColor recorder |
	drawBlock value: (recorder := self as: PenPointRecorder).
	region := Rectangle encompassing: recorder points.
	tileForm := Form extent: region extent+6.
	tilePen := Pen newOnForm: tileForm.
	tilePen location: location-(region origin-3)
		direction: direction
		penDown: penDown.
	drawBlock value: tilePen.  "Draw the shape in B/W"
	saveColor := halftoneForm.
	drawBlock value: self.
	halftoneForm := saveColor.
	shape := (tileForm findShapeAroundSeedBlock: [:f | f borderWidth: 1]) reverse.
	shape copy: shape boundingBox from: tileForm to: 0@0 rule: Form erase.
	destForm fillShape: shape fillColor: color at: region origin-3