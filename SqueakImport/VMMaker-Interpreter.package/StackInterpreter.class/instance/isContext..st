internal interpreter access
isContext: oop
	<inline: true>
	^(objectMemory isNonIntegerObject: oop) and: [self isContextHeader: (objectMemory baseHeader: oop)]