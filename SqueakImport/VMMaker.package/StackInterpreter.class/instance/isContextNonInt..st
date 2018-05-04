internal interpreter access
isContextNonInt: oop
	<inline: true>
	^self isContextHeader: (objectMemory baseHeader: oop)