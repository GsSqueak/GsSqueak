resources
colorMemoryImage
	^ self imageLibrary
		at: #colorMemoryImage
		ifAbsentPut: [| offset chart spec fillStyle colorMemoryImage |
			offset := 7 @ 6.
			chart := self colorChart.
			colorMemoryImage := Form extent: chart extent + (offset * 2) depth: chart depth.
			spec := #(#(1.0 #(0.4 0.6 0.8 ) ) #(0.67 #(0.6 0.6 0.8 ) ) #(0.33 #(0.6 0.8 0.8 ) ) #(0.0 #(0.6 0.8 0.9 ) ) ).
			fillStyle := GradientFillStyle
						ramp: (spec
								collect: [:e | e first
										-> (Color fromRgbTriplet: e second)]).
			fillStyle origin: 0 @ (colorMemoryImage extent y // 2);
				 direction: colorMemoryImage extent x @ 0.
			(colorMemoryImage getCanvas
				copyOrigin: 0 @ 0
				clipRect: (0 @ 0 extent: colorMemoryImage extent))
				fillRectangle: (0 @ 0 extent: colorMemoryImage extent)
				fillStyle: fillStyle;
				
				frameAndFillRectangle: (0 @ 0 extent: colorMemoryImage extent)
				fillColor: Color transparent
				borderWidth: 1
				borderColor: Color black.
			colorMemoryImage
				copy: (0 @ 0 extent: chart extent)
				from: chart
				to: offset
				rule: Form over.
			colorMemoryImage]