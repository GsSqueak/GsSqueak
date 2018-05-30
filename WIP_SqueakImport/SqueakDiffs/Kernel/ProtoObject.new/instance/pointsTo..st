tracing
pointsTo: anObject
"Answers true if I hold a reference to anObject, or false otherwise. Or stated another way:

Answers true if the garbage collector would fail to collect anObject because I hold a reference to it, or false otherwise"

	^ (self instVarsInclude: anObject)
		or: [self class == anObject]
