*SqClasses-accessing method dictionary
firstPrecodeCommentFor:  selector
	"If there is a comment in the source code at the given selector that preceeds the body of the method, return it here, else return nil"

	| parser source tree |
	"Behavior firstPrecodeCommentFor: #firstPrecodeCommentFor:"
	(#(Comment Definition Hierarchy) includes: selector)
		ifTrue:
			["Not really a selector"
			^ nil].
	source := self sourceCodeAt: selector asSymbol ifAbsent: [^ nil].
	parser := self newParser.
	tree := 
		parser
			parse: (ReadStream on: source)
			class: self
			noPattern: false
			notifying: nil
			ifFail: [^ nil].
	^ (tree comment ifNil: [^ nil]) first
