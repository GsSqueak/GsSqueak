private
privateFullMoveBy: delta
  "Private! Relocate me and all of my subMorphs by recursion.
	Subclasses that implement different coordinate systems may override
	this method."

  self privateMoveBy: delta.
  1 to: submorphs size do: [ :i | (submorphs at: i) privateFullMoveBy: delta ].
  self owner
    ifNotNil: [ 
      self owner isTextMorph
        ifTrue: [ self owner adjustTextAnchor: self ] ]