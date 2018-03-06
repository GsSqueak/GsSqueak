pragmas
pragmaPrimitives
	| primitives |
	self properties isEmpty
		ifTrue: [^ 0].
	primitives := properties pragmas
				select: [:pragma | self class primitivePragmaSelectors includes: pragma keyword].
	primitives isEmpty
		ifTrue: [^ 0].
	primitives size > 1
		ifTrue: [^ self notify: 'Ambigous primitives'].
	^ self perform: primitives first keyword withArguments: primitives first arguments