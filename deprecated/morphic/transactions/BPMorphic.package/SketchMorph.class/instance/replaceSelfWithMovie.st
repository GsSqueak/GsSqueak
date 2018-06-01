other
replaceSelfWithMovie
	"Replace this SketchMorph in its owner with a MovieMorph containing
	this sketch as its only frame. This allows a SketchMorph to be turned
	into a MovieMorph by just insering additional frames."
	| _gsSqueakTemp_o _gsSqueakTemp_movie |
	self changed.
	_gsSqueakTemp_o := self owner.
	_gsSqueakTemp_movie := MovieMorph new position: self referencePosition.
	_gsSqueakTemp_movie
		insertFrames: (Array with: self).
	_gsSqueakTemp_o
		ifNil: [^ _gsSqueakTemp_movie].
	_gsSqueakTemp_o addMorphFront: _gsSqueakTemp_movie.
	^ _gsSqueakTemp_movie