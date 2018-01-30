private
privateDeleteWithAbsolutelyNoSideEffects
	"Private! Should only be used by methods that maintain the
	ower/submorph invariant."
	"used to delete a morph from an inactive world"
	owner
		ifNil: [^ self].
	owner privateRemoveMorphWithAbsolutelyNoSideEffects: self.
	owner := nil