other
replaceSelfWithMovie
	"Replace this SketchMorph in its owner with a MovieMorph containing this sketch as its only frame. This allows a SketchMorph to be turned into a MovieMorph by just insering additional frames."

	| o movie |
	self changed.
	o := self owner.
	movie := MovieMorph new position: self referencePosition.
	movie insertFrames: (Array with: self).
	o ifNil: [^ movie].
	o addMorphFront: movie.
	^ movie
