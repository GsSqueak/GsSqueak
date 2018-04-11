private
privateDeleteWithAbsolutelyNoSideEffects
  "Private! Should only be used by methods that maintain the
	ower/submorph invariant."

  "used to delete a morph from an inactive world"

  self owner ifNil: [ ^ self ].
  self owner privateRemoveMorphWithAbsolutelyNoSideEffects: self.
  owner2 := nil