change reporting
invalidRect: damageRect from: aMorph
	"Try setting 'quickRedraw' to true. This invalidates the entire morph, whose bounds typically subsume all it's submorphs. (However, this code checks that assumption and passes through any damage reports for out-of-bounds submorphs. Note that atoms with super-high velocities do occaisionally shoot through the walls!) An additional optimization is to only submit only damage report per display cycle by using the damageReported flag, which is reset to false when the morph is drawn."

	| quickRedraw |
	quickRedraw := true.  "false gives the original invalidRect: behavior"
	(quickRedraw and:
	 [(bounds origin <= damageRect topLeft) and:
	 [damageRect bottomRight <= bounds corner]]) ifTrue: [
		"can use quick redraw if damage is within my bounds"
		damageReported ifFalse: [super invalidRect: bounds from: self].  "just report once"
		damageReported := true.
	] ifFalse: [super invalidRect: damageRect from: aMorph].  "ordinary damage report"