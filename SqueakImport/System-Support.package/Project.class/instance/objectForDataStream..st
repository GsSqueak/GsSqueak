file in/out
objectForDataStream: refStrm
	| uu dp |
	"I am about to be written on an object file.  Write a path to me in the other system instead."

	"Use a copy with no parent, previous or next to reduce extra stuff copied"
	refStrm project == self ifTrue: [^ self copy setParent: nil].

	dp := (uu := self url) size > 0 ifTrue: [
		DiskProxy global: #Project selector: #namedUrl: args: {uu}.
	] ifFalse: [
		DiskProxy global: #Project selector: #named: args: {self name}
	].
	refStrm replace: self with: dp.
	^ dp
