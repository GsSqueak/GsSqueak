private
image: form at: aPoint sourceRect: sourceRect rule: rule 
	| aForm |
	self preserveStateDuring:
		[:inner | inner translate: aPoint + self origin.
		aForm := form depth <= 8 ifTrue: [form asFormOfDepth: 32] ifFalse: [form].
		target write: ((aForm colorsUsed includes: Color transparent)
			ifTrue: [| top f2 c2 offset |
				"tfel: This was taken from SketchMorph, but is actually needed for all 
				forms that use transparency"
				offset := currentTransformation ifNil: [0@0] ifNotNilDo: [:t | t offset].
				top := self topLevelMorph.
				f2 := Form extent: aForm extent depth: self depth.
				c2 := f2 getCanvas.
				c2 fillColor: Color white.
				c2
					translateBy: offset - self origin - aPoint
					clippingTo: f2 boundingBox
					during: [:c | top fullDrawOn: c].
				f2]
			ifFalse: [aForm])].
