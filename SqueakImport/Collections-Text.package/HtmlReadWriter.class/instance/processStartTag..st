reading
processStartTag: aTag

	| index |
	(self isTagIgnored: aTag) ifTrue: [^ self].

	index := count - offset.

	aTag = '<br>' ifTrue: [
		self addCharacter: Character cr.
		^ self].
	(aTag beginsWith: '<img') ifTrue: [
		self addString: '[image]'.
		^ self].
	
	self processRunStackTop. "To add all attributes before the next tag adds some."

	"Copy attr list and add new attr."
	runStack push: ({runStack top first copy addAll: (self mapTagToAttribute: aTag); yourself. index + 1 . index + 1}).
	