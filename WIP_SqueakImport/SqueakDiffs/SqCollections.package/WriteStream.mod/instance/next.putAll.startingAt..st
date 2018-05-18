accessing
next: anInteger putAll: aCollection startingAt: startIndex
	"Store the next anInteger elements from the given collection."

	| newEnd |
	anInteger > 0 ifFalse: [ ^aCollection ].
	(collection class == aCollection class
		or: [ collection isString 
			and: [ aCollection isString
			and: [ collection class format = aCollection class format ] ] ]) "Let Strings with the same field size as collection take the quick route too."
		ifFalse: [ ^super next: anInteger putAll: aCollection startingAt: startIndex ].

	newEnd := position + anInteger.
	newEnd > writeLimit ifTrue:
		[self growTo: newEnd + 10].

	collection replaceFrom: position+1 to: newEnd  with: aCollection startingAt: startIndex.
	position := newEnd.

	^aCollection