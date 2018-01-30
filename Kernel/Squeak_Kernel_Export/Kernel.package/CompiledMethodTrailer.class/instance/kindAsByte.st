private
kindAsByte
	| index |
	index := self class trailerKinds indexOf: kind.
	self assert: (index ~= 0).

	^ (index - 1) << 2