resources
colorMemoryThinImage
	^self imageLibrary at: #colorMemoryThinImage ifAbsentPut:
		[| offset chart spec fillStyle thinImage |
		offset := 7@6.
		chart := self colorChart.
		thinImage := Form extent: 42@101 depth: chart depth.
		spec := #(
			(1.00 #(0.4 0.6 0.8))
			(0.67 #(0.6 0.6 0.8))
			(0.33 #(0.6 0.8 0.8))
			(0.00 #(0.6 0.8 0.9))).
		fillStyle := GradientFillStyle ramp: (spec collect: [:e | e first -> (Color fromRgbTriplet: e second)]).
		fillStyle origin: 0@(thinImage extent y //2); direction: thinImage extent x @0.
		(thinImage getCanvas copyOrigin: 0@0 clipRect: (0@0 extent: thinImage extent))
			fillRectangle: (0@0 extent: thinImage extent) fillStyle: fillStyle;
			frameAndFillRectangle: (0@0 extent: thinImage extent) fillColor: Color transparent borderWidth: 1 borderColor: Color black.
		thinImage copy: (chart extent x - thinImage extent x + (2*offset x)@0 corner: chart extent x @ (chart extent y min: thinImage extent y - (2 * offset y))) from: chart to: offset rule: Form over.
		thinImage]