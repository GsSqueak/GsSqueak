change reporting
updateColorRamp
	| newAssociation newKey newColor sketch colorRamp |
	
	self updateRampMorphs.
	colorRamp := OrderedCollection new.
	rampMorphs
		do: [:i | 
			newKey := ((i position x - gradientDisplay left / gradientDisplay width) asFloat roundUpTo: 0.01)
						min: 1.0
						max: 0.0.
			sketch := i findA: SketchMorph.
			newColor := sketch rotatedForm colorAt: sketch rotatedForm center.
			newAssociation := newKey -> newColor.
			colorRamp addLast: newAssociation].
	colorRamp := colorRamp sorted.
	gradientDisplay colorRamp: colorRamp.
	gradientDisplay fillStyle direction: gradientDisplay extent x @ 0.
	self changed.
	target ifNotNil:[
			target perform: selector
			with: colorRamp 
			with: morph].
	self changed: #colorRamp