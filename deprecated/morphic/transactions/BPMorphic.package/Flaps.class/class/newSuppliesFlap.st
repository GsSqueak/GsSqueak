predefined flaps
newSuppliesFlap
	"Answer a fully-instantiated flap named 'Supplies' to be placed at the
	bottom of the screen; this is for the non-plug-in-version"
	^ self newSuppliesFlapFromQuads: self quadsDefiningSuppliesFlap positioning: #right