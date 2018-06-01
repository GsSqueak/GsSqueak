costume
knownSketchCostumeWithSameFormAs: aSketchMorph 
	| _gsSqueakTemp_itsForm |
	_gsSqueakTemp_itsForm := aSketchMorph form.
	^ costumes
		ifNotNil: [costumes
				detect: [:c | c isSketchMorph
						and: [c form == _gsSqueakTemp_itsForm]]
				ifNone: []]