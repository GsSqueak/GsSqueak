reading
processEmptyTag: aTag

	(aTag beginsWith: '<br') ifTrue: [
		self addCharacter: Character cr.
		^ self].
	
	(self isTagIgnored: aTag)
		ifTrue: [^ self].
		
	"TODO... what?"