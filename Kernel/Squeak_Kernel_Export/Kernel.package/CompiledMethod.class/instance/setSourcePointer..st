source code management
setSourcePointer: srcPointer
	"We can't change the trailer of existing method, since it could have a
	 completely different format. Therefore we need to generate a copy
	 with new trailer, containing a srcPointer, and then #become it."
	| trailer copy start |
	trailer := srcPointer = 0
				ifTrue: "catch the common case of setting the source pointer to 0 when already 0"
					[self sourcePointer = 0 ifTrue:
						[^self].
					 CompiledMethodTrailer empty]
				ifFalse:
					[CompiledMethodTrailer new sourcePointer: srcPointer].
	copy := self copyWithTrailerBytes: trailer.

	"ar 3/31/2010: Be a bit more clever since #become: is slow.
	If the old and the new trailer have the same size, just replace it."
	(self trailer class == trailer class and:[self size = copy size])
		ifTrue:
			[start := self endPC + 1.
			self replaceFrom: start to: self size with: copy startingAt: start]
		ifFalse:
			[self becomeForward: copy].

	^self "will be copy if #become was needed"
