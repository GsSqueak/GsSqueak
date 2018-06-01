*Morphic
open: anObject

	anObject isBehavior ifTrue: [
		^ anObject browse].
	anObject isCompiledMethod ifTrue: [
		^ ToolSet browse: anObject methodClass selector: anObject selector].
	anObject class == MethodReference ifTrue: [
		^ ToolSet browse: anObject actualClass selector: anObject selector].
	anObject isSymbol ifTrue: [
		SystemNavigation default browseAllImplementorsOf: anObject.
		SystemNavigation default browseAllCallsOn: anObject.
		^ self].