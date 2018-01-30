file in/out
zapSourcePointer

	"clobber the source pointer since it will be wrong"
	| copy |
	copy := self copyWithTrailerBytes: CompiledMethodTrailer empty.
	self becomeForward: copy.
	^ copy
